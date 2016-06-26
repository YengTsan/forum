class AddHeadShotToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :head_shot 
  end
end
