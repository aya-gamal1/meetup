class GroupsController < ApplicationController
def new
  @group = Group.new
end

def index
    @groups = Group.all
  end

def create
  @group = Group.new(group_params)
   @tag = Tag.new(tag_params)
	group_id=Group.last.id 
	tag_id=Tag.last.id 
   @tag_group = TagGroup.new(:group_id=> group_id,:tag_id=> tag_id)

 if  @group.save and @tag.save and @tag_group.save
  redirect_to @group
else
render 'new'
  end
end




def show
    @group = Group.find(params[:id])
id=current_user.id
group_id=params[:id]
@groupmemebe = GroupMemeber.where({:group_id=>group_id,:user_id=>id})
@groupcount = GroupMemeber.where({:group_id=>group_id})  
@groupadmin = Group.where({:id=>group_id,:user_id=>id}) 

@count=@groupcount.count

end




def edit

@group=Group.find(params[:id])
end

def update

@group=Group.find(params[:id])
if @group.update(group_params) 
redirect_to @group
else 
render 'edit'
end
end

def destroy
@group=Group.find(params[:id])
group_id=params[:id]



if @group.destroy 
redirect_to groups_path

end
end

def action

	@groupmemeber = GroupMemeber.new(groupmemeber_params)
@groupmemeber.save
	id=GroupMemeber.last.group_id 

redirect_to group_path(:id=>id)
end



private
  def group_params
    params.require(:group).permit(:topicname, :description, :avatar,:user_id)
  end
 def tag_params
    params.require(:tag).permit(:name)
  end
def grouptag_params
    params.require(:grouptag).permit(:group_id,:tag_id)
  end
def groupmemeber_params

 params.permit(:group_id,:user_id)
  end


end
