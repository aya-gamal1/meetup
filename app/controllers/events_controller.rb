class EventsController < ApplicationController


def new

end
def find
    @events = Event.where("date > ?", params[:date])
    
    respond_to do |format|
      format.html
      format.json {render json: @events }
    end
     

end


def create
    @group = Group.find(params[:group_id])
    @event = @group.events.create(event_params)
    redirect_to group_event_path(@group,@event)
end

def show

    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])
end
 

def destroy
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])
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
end
end





private
    def event_params
      params.require(:event).permit(:location, :description,:title,:avatar,:data,:time)
    end

end
