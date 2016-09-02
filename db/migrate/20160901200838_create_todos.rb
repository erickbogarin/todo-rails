class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name, limit: 30
      t.string :description, limit: 300
      t.boolean :completed, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
