class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.text :body
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
