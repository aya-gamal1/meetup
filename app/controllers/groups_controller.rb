class GroupsController < ApplicationController
def new
  @group = Group.new
end
def search
  @location =params[:location]
  @distance =params[:distance]
  
  @tag = Tag.where("name = ?",params[:tag])
  @groups_tags=TagGroup.where("tag_id = ?",@tag[0].id)
  @group_ids =[];
  @groups_tags.each do |group_tag|
    @group_ids.push(group_tag.group_id)
  end
  @groups= Group.where("id IN (?)",@group_ids).near(@location, @distance)
  # @groups=@groups
  render 'index'


end  

def index
    @groups = Group.all
  end

def create
  @group = Group.new(group_params)
  @coors=Geocoder.coordinates(@group.location)
  @group.latitude=@coors[0]
  @group.longitude=@coors[1]
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
if @group.destroy
redirect_to groups_path
end
end


private
  def group_params
    params.require(:group).permit(:topicname, :description, :avatar, :location, :latitude, :longitude)
  end
 def tag_params
    params.require(:tag).permit(:name)
  end
def grouptag_params
    params.require(:grouptag).permit(:group_id,:tag_id)
  end

end
