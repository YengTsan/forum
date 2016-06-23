class CommentsController < ApplicationController
  before_action :set_topic

  def create
    @comment = @topic.comments.create( comment_params )
    redirect_to :back
  end

  protected

  def set_topic
    @topic = Topic.find( params[:topic_id] )
  end

  def comment_params
    params.require( :comment ).permit( :content )
  end

end
