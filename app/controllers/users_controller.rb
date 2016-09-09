class UsersController < ApplicationController
	before_filter :set_user, only: [:show, :edit, :update]
	before_filter :validate_authorization_for_user, only: [:edit, :update]

	def show
	end

	def edit
	end

	def update 
		if @user.update_attributes(user_params)
			redirect_to @user, notice: 'User was successfully updated.'
		else
			render action: 'edit'
		end
	end

	private 
	
	def set_user 
		@user = User.find(params[:id])
	end

	def validate_authorization_for_user
		redirect_to root_path unless @user == current_user
	end

	def user_params
		params.require(:user).permit(:name, :about)
	end

end
