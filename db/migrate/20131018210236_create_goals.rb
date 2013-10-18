class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false
      t.boolean :is_private, :null => false, :default => false
      t.boolean :complete, :null => false, :default => false

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
