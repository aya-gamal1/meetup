class EventsController < ApplicationController


def new
@group=Group.find(params[:group_id])
  @event = Event.new
end
def find

  if request.xhr?
    @events = Event.where("date > ?", params[:date])
    render partial: 'find'
  else
  end     
end


def create
    @group = Group.find(params[:group_id])
    @event = @group.events.new(event_params)


if @event.save
    redirect_to group_event_path(@group,@event)
#redirect_to group_path(@group)
else
render 'new'
  end
end

def show

    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])

id=current_user.id
event_id=params[:id]
@eventmember = EventAdmin.where({:event_id=>event_id,:user_id=>id}) 
@eventcount = EventAdmin.where({:event_id=>event_id}) 
@eventadmin = Event.where({:id=>event_id,:user_id=>id}) 
@count=@eventcount.count
end
 

def destroy
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])
@event.avatar = nil
@event.save
    @event.destroy
    redirect_to group_path(@group)
  end



def edit

@group=Group.find(params[:group_id])
@event = @group.events.find(params[:id])
end


def update

@group=Group.find(params[:group_id])
@event = @group.events.find(params[:id])
if @event.update(event_params)
redirect_to @group
else 
render 'edit'
end
end


def action

	@eventmemeber = EventAdmin.new(eventmemeber_params)
@eventmemeber.save
	id=EventAdmin.last.event_id 

x= params.permit(:group_id)
 
redirect_to group_event_path(:group_id=>x['group_id'],:id=>id)
end


private
    def event_params
      params.require(:event).permit(:location, :description,:title,:avatar,:date,:time,:user_id,:group_id)
    end
def eventmemeber_params

 params.permit(:event_id,:user_id)
  end

end
