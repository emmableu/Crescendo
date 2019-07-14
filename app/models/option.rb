# == Schema Information
#
# Table name: options
#
#  id         :integer          not null, primary key
#  quiz_id    :integer
#  optionbody :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order      :integer
#  comment    :text
#
# Indexes
#
#  index_options_on_quiz_id  (quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (quiz_id => quizzes.id)
#

class Option < ActiveRecord::Base
  belongs_to :quiz
end
