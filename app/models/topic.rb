class Topic < ActiveRecord::Base

  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>", nano: "25x25>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/

  validates :name, :content, presence: true

  has_many :comments, :dependent => :destroy
  has_many :topic_category_ships
  has_many :categories, :through => :topic_category_ships

  has_many :like_topics, :dependent => :destroy
  has_many :liked_topics, :through => :like_topics, :source => :topic

  belongs_to :user

  def self.sorted_by_lasted_updated
    @topics = Topic.all.sort_by do |t|
      t.comments.exists? ? t.comments.last.updated_at : t.updated_at
    end
    @topics.reverse
  end

  def self.sorted_by_number_of_comments
    @topics = Topic.all.sort_by do | topic |
      Comment.count_by_topic_id( topic.id )
    end
    @topics.reverse
  end

  def self.sorted_by_topic_capital
    @topics = Topic.all.sort_by { |t| t.name }
  end

end
