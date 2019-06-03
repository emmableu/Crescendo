class CreateMinitasks < ActiveRecord::Migration
  def change
    create_table :minitasks do |t|
      t.string :title
      t.references :task, index: true, foreign_key: true
      t.text :test_file
      t.text :starter_file
      t.integer :difficulty
      t.integer :order
      t.datetime :created_at
      t.datetime :updated_at
      t.text :instruction
      t.text :ppxmlfile

      t.timestamps null: false
    end
  end
end
