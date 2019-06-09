class AddMinitasksToQuizzes < ActiveRecord::Migration
  def change
    add_reference :quizzes, :minitask, index: true, foreign_key: true
  end
end
