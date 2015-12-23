class HomeController < ApplicationController

	def index
		@contacts = Contact.order('last_name asc')
	end

end
