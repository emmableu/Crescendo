# == Schema Information
#
# Table name: quizzes
#
#  id          :integer          not null, primary key
#  name        :string
#  quizbody    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  solution    :text
#  minitask_id :integer
#
# Indexes
#
#  index_quizzes_on_minitask_id  (minitask_id)
#
# Foreign Keys
#
#  fk_rails_...  (minitask_id => minitasks.id)
#

class Quiz < ActiveRecord::Base
end
