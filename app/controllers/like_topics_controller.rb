class LikeTopicsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic

  def create
    
    @like = @topic.like_topics.where( :user => current_user )
    LikeTopic.create!( :topic => @topic, :user => current_user ) unless @like.exists?

    render "reload"

  end

  def unlike
    @like =  LikeTopic.where( :user => current_user, :topic_id => params[:topic_id] ).first
    @like.destroy

    render "reload"

  end

  protected

  def set_topic
    @topic = Topic.find( params[:topic_id] )
  end

end
