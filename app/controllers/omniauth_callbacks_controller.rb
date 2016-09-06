class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	skip_before_filter :authenticate_user!
	def all
		
		auth = env["omniauth.auth"]
		p auth

		user = User.from_omniauth(auth, current_user)

		if user.persisted?
			flash[:notice] = "You are in..!!! Go to edit profile to see the status for the accounts"
			sign_in_and_redirect(user)
		else
			session["devise.user_attributes"] = user.attributes
			redirect_to new_user_registration_url
		end

	end

	alias_method :twitter, :all
end
