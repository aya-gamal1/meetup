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
     redirect_to root_url, :notice => "Signed up!"
     #redirect_to "groups/index"
  else
    #redirect_to "groups/index"
    redirect_to root_url, :notice => "Signed up!"
  end
end
def show
    @user = User.find(params[:id])
end
def edit

@user=User.find(params[:id])
end

def update

@user=User.find(params[:id])
if @user.update(user_params)
redirect_to @user
else 
render 'edit'
end
end

def destroy
@user=User.find(params[:id])
if @user.destroy
redirect_to users_path
end
end
def index
    @users = User.all
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :gender, :city, :country, :age, :avatar,:isadmin)
  end
end
