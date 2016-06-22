class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :content
      t.integer :view_count

      t.timestamps null: false
    end
  end
end
