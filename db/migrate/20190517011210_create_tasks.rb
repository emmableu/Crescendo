class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :category, index: true, foreign_key: true
      t.text :test_file
      t.text :starter_file
      t.integer :difficulty
      t.integer :order
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
