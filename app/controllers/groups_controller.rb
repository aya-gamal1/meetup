class GroupsController < ApplicationController
def new

end

def index
    @groups = Group.all
  end

def create
  @group = Group.new(group_params)
 
  @group.save
  redirect_to @group
end

def show
    @group = Group.find(params[:id])
end

def edit

@group=Group.find(params[:id])
end

def update

@group=Group.find(params[:id])
if @group.update(group_params)
redirect_to @group
end
end

def destroy
@group=Group.find(params[:id])
if @group.destroy
redirect_to groups_path
end
end


private
  def group_params
    params.require(:group).permit(:topicname, :description, :avatar)
  end

end
