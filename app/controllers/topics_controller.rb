class TopicsController < ApplicationController

  def index
    @topics = Topic.all unless params[ :order ]
    @topics = Topic.sorted_by_lasted_updated if params[ :order ] == "last_time"
    @topics = Topic.sorted_by_number_of_comments if params[ :order ] == "num_of_comments"
    @topics = Topic.sorted_by_topic_capital if params[ :order ] == "capital"
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new( topic_params )
    @topic.save

    redirect_to topics_path
  end

  def show
    @topic = Topic.find( params[:id] )
    @comments = Comment.find_comments_by_topic_id( params[:id] ) # 可以撈到這篇文章所有comments
    @comment = Comment.new # 可以在這個頁面直接創造一個新的comment
  end

  def about
    
  end

  protected

  def topic_params
    params.require( :topic ).permit( :name, :content, :category_ids => [] )
  end

end
