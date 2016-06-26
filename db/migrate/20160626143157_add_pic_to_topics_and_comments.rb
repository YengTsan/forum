class AddPicToTopicsAndComments < ActiveRecord::Migration
  def change
    add_attachment :topics, :pic
    add_attachment :comments, :pic
  end
end
