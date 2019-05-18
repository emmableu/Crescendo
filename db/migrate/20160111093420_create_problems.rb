class CreateProblems < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.float :points
      t.text :content
      t.text :test_file
      t.text :starter_file
      t.jsonb :metadata
      # t.references :category

      t.timestamps null: false
    end
  end
end
