# == Schema Information
#
# Table name: testscripts
#
#  id          :integer          not null, primary key
#  task_id     :integer
#  scriptarray :text             default("{}"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_testscripts_on_task_id  (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.id)
#

class Testscript < ActiveRecord::Base
  validates :scriptarray, presence: true
  # validates :task_id, presence: true
  # validates :task_id, uniqueness: true
  belongs_to :task
end
