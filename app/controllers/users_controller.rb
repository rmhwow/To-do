class UsersController < ApplicationController
  
  def show
    @user = User.find(current_user)
    @tasks = @user.tasks
  end

  def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       render :show
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
   private
   def user_params
     params.require(:user).permit(:name,:email, :password)
   end
end
