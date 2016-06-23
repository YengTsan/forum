class CommentsController < ApplicationController
  before_action :set_topic

  def create
    @comment = @topic.comments.create( comment_params )

    if @comment.valid?
      redirect_to :back
    else
      flash[:alert] = "Comments cann't be blank"
      redirect_to :back
    end

  end

  protected

  def set_topic
    @topic = Topic.find( params[:topic_id] )
  end

  def comment_params
    params.require( :comment ).permit( :content )
  end

end
