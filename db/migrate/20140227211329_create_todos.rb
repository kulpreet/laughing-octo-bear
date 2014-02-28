class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :description, :null => false
      t.integer :priority
      t.timestamp :due_date
      t.boolean :completed
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
