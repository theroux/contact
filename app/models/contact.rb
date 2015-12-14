require 'csv'
require 'phone'
Phoner::Phone.default_country_code = '1'

class Contact < ActiveRecord::Base


	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email_address, presence: true
	validates :phone_number, presence: true
	validates :company_name, presence: true
	
	# Modified from
	# https://richonrails.com/articles/importing-csv-files
	def self.import(file)
		#col_sep allows it to take TSV instead of CSV
	    CSV.foreach(file.path, headers: true, col_sep: "\t", header_converters: :symbol) do |row|
	    	
	    	# Prevent duplicates based on email address
	    	# http://stackoverflow.com/questions/21498137/importing-csv-data-to-update-existing-records-with-rails
	    	#entry = find_by(email_address: row[:email_address]) || new

	    	#entry.update row.to_hash
      		#entry.save!

      		phoneParsed = Phoner::Phone.parse(row[:phone_number]);

		    	Contact.create!(
		    		first_name:    row[:first_name],
					last_name:     row[:last_name],
					email_address: row[:email_address],
					phone_number:  phoneParsed.format("+ %c (%a) %n %x") ,
					company_name:  row[:company_name]
		    	)

		    #contact_hash = row.to_hash # exclude the price field

		    #contact = Contact.where(id: contact_hash["id"])

		    #if contact.count == 1
		    #	contact.first.update_attributes(contact_hash)
		    #else
		    #    Contact.create!(contact_hash)
		    #end # end if !product.nil

	    end # end CSV.foreach
  	end # end self.import(file)

end
