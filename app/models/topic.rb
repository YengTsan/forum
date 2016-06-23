class Topic < ActiveRecord::Base

  has_many :comments, :dependent => :destroy

  def self.sorted_by_lasted_updated
    @topics = Topic.all.sort_by do |t|
      t.comments.exists? ? t.comments.last.updated_at : t.updated_at
    end
    @topics.reverse
  end

  def self.sorted_by_number_of_comments
    @topics = Topic.all.sort_by do | topic |
      Comment.count_by_topic_id(topic.id)
    end
    @topics.reverse
  end

end
