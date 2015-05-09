class UsersController < ApplicationController
  


def index
   
end
def new
    @user = User.new
end

def create
    @user = User.new(user_params)
  if @user.save
       UserMailer.welcome_email(@user).deliver_now
     #redirect_to root_url, :notice => "Signed up!"
     render "show"
  else
    render "new"
  end
end
def show
    @user = User.find(params[:id])
end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :gender, :city, :country, :age, :avatar)
  end
end
