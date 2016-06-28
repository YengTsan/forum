class CommentsController < ApplicationController
  before_action :set_topic
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    @comment = @topic.comments.new( comment_params )
    @comment.user = current_user
    @comment.save

    if @comment.valid?
      redirect_to :back
    else
      flash[:alert] = "Comments cann't be blank"
      redirect_to :back
    end

  end

  def destroy
    @comment = Comment.find( params[:id] )
    @comment.destroy if current_user.can_edit?(@comment)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end

  end


  protected

  def set_topic
    @topic = Topic.find( params[:topic_id] )
  end

  def comment_params
    params.require( :comment ).permit( :content, :user_id, :pic )
  end

end
