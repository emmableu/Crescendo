class AddSolutionToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :solution, :text
  end
end
