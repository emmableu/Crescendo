class ChangeColumnNameQuizOptions < ActiveRecord::Migration
  def change
    rename_column :quizzes, :quizbody, :quizbody_en
    rename_column :options, :optionbody, :optionbody_en
    add_column :quizzes, :quizbody_zh, :text
    add_column :options, :optionbody_zh, :text
  end
end
