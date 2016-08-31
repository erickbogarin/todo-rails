describe "the signup process", :type => :feature do
	it "signs me up" do
		visit '/users/sign_up'
		within('#new_user') do 
			fill_in 'Email', :with => 'erickbogarin@email.com'
			fill_in 'Password', :with => 'qwe123'
			fill_in 'Password confirmation', :with => 'qwe123'
		end
		click_button 'Sign up'
		expect(page).to have_content 'Welcome'
	end	
end

describe "the login process", :type => :feature do
	before :each do
		User.create!(:email => 'user@example.com', :password => 'password')
	end
	it "signs me in" do
		visit '/users/sign_in'
		within('#new_user') do 
			fill_in 'Email', :with => 'user@example.com'
			fill_in 'Password', :with => 'password'
		end
		click_button 'Log in'
		expect(page).to have_content 'Signed in successfully'
	end	
end