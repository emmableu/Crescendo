class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :quiz, index: true, foreign_key: true
      t.text :quizbody

      t.timestamps null: false
    end
  end
end
