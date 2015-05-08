class CommentsController < ApplicationController


def create
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    redirect_to group_event_path(@group,@event)
end
 
def destroy
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:event_id])

    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to group_event_path(@group,@event)
  end



def edit
@group = Group.find(params[:group_id])
@event=Event.find(params[:event_id])
@comment = @event.comments.find(params[:id])
end


def update
    @group = Group.find(params[:group_id])
@event=Event.find(params[:event_id])
@comment = @event.comments.find(params[:id])
if @comment.update(comment_params)
    redirect_to group_event_path(@group,@event)
else 
render 'edit'
end
end





private
    def comment_params
      params.require(:comment).permit(:text)
    end


end
