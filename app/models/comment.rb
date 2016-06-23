class Comment < ActiveRecord::Base

  validates :content, presence: true
  belongs_to :topic

  def self.find_comments_by_topic_id( topic_id )
    Comment.where( :topic_id => topic_id )
  end

  def self.count_by_topic_id( topic_id )
    Comment.where( :topic_id => topic_id ).count
  end

end
