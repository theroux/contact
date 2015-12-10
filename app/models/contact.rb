class Contact < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email_address, presence: true
	validates :phone_number, presence: true
	validates :company_name, presence: true
end
