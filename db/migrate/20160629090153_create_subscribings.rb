class CreateSubscribings < ActiveRecord::Migration
  def change
    create_table :subscribings do |t|
      t.integer :topic_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
