class EventsController < ApplicationController


def new
  @event = Event.new
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





private
    def event_params
      params.require(:event).permit(:location, :description,:title,:avatar,:date,:time)
    end

end
