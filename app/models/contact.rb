require 'csv'

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

				entry = find_by(email_address: row[:email_address]) || new

				# Look for extension denoted by 'x'
				phoneArray = row[:phone_number].split('x')
				ext = phoneArray[1]
				phoneNum = phoneArray[0].gsub(/[^0-9]/, '')

				# In the provided data set all 10-digit phone numbers are international
				if phoneNum.length <= 10
					intl = true
					phoneNum.insert(6, '-')
					phoneNum.insert(3, '-')

				else
					# Tests the 11 digit numbers in data set against Phonelib to make sure they're not Canadian
					# bc Canada shares the U.S. +1 prefix
					intl = Phonelib.valid_for_country? phoneNum, 'CA'
					phoneNum.insert(7, '-')
					phoneNum.insert(4, '-')
					phoneNum.insert(1, '-')
				end

				if row[:email_address].end_with? ".com"
					emaildotcom = true
				else
					emaildotcom = false
				end

				entry.first_name = row[:first_name]
				entry.last_name = row[:last_name]
				entry.email_address = row[:email_address]
				entry.phone_number = phoneNum
				entry.extension = ext
				entry.international = intl
				entry.company_name = row[:company_name]
				entry.dotcom = emaildotcom

      	entry.save!

=begin
		    Contact.create!(
		    	first_name:    row[:first_name],
					last_name:     row[:last_name],
					email_address: row[:email_address],
					phone_number:  row[:phone_number],
					company_name:  row[:company_name]
		    )
=end

	    end # end CSV.foreach
  	end # end self.import(file)

end
