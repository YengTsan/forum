class TopicCategoryShip < ActiveRecord::Base

  belongs_to :category
  belongs_to :topic

end
