class CreateTestscripts < ActiveRecord::Migration
  def change
    create_table :testscripts do |t|
      t.references :task, index: true, foreign_key: true
      t.string :scriptarray, :string, array: true, default: []

      t.timestamps null: false
    end
  end
end
