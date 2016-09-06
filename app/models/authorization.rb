class Authorization < ActiveRecord::Base
	belongs_to :user

	after_create :fetch_details


	def fetch_details
		self.send("fetch_details_from_#{self.provider.downcase}")
	end


	def fetch_details_from_twitter

	end

	def self.find auth
		Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize		
	end
end
