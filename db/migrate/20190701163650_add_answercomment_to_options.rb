class AddAnswercommentToOptions < ActiveRecord::Migration
  def change
    add_column :options, :comment, :text
  end
end
