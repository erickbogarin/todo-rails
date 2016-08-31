require 'rails_helper'

RSpec.describe User, type: :model do

	describe '.create' do
		it "does not create an user with an existing email" do
			User.create(email: "erickbogarin@email.com", password: "12345678")

			expect { 
				User.create!(email: "erickbogarin@email.com", password: "12345678") 
			}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it "does not accept password length less than six" do
			user = User.new
			user.email = "erickbogarin@email.com"

			user.password = "1234"

			expect(user.valid?).to be_falsey
		end
	end
end

