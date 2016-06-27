class LikeTopicsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic

  def create
    LikeTopic.create!( :topic => @topic, :user => current_user )

    redirect_to :back
  end

  def destroy
    like = LikeTopic.find( params[:id] )
    like.destroy

    redirect_to :back
  end

  def unlike
    LikeTopic.where( :user => current_user, :topic_id => params[:topic_id] ).first.destroy

    redirect_to :back
  end

  protected

  def set_topic
    @topic = Topic.find( params[:topic_id] )
  end

end
