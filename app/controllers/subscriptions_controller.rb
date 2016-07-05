class SubscriptionsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic

  def subscribe
    @subcription = @topic.subscribings.where( :user => current_user )
    Subscribing.create!( :topic => @topic, :user => current_user ) unless @subcription.exists?

    render "reload"
  end

  def unsubscribe
    @subcription = Subscribing.where( :user => current_user, :topic => @topic ).first
    @subcription.destroy

    render "reload"
  end

  protected

  def set_topic
    @topic = Topic.find( params[:topic_id] )
  end

end
