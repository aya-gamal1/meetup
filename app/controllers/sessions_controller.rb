class SessionsController < ApplicationController
 def new
  end
def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    	if  user.isadmin== "admin"	
    		redirect_to users_path, :notice => "Logged in!" # go to page of list users 
    	else
               redirect_to groups_path # go to page of list of groups
               # @users = User.all
               #  @users.each do |user|

               #      UserMailer.users_email(user).deliver_now
               # end
	end
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to log_in_url, :notice => "Logged out!"
end
end
