class Comment < ActiveRecord::Base

  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>", nano: "25x25>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/

  validates :content, presence: true
  belongs_to :topic
  belongs_to :user

  def self.find_comments_by_topic_id( topic_id )
    Comment.where( :topic_id => topic_id )
  end

  def self.count_by_topic_id( topic_id )
    Comment.where( :topic_id => topic_id ).count
  end

end
