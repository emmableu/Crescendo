# == Schema Information
#
# Table name: descriptions
#
#  id         :integer          not null, primary key
#  body       :text
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_descriptions_on_task_id  (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.id)
#

class Description < ActiveRecord::Base
  belongs_to :task
end
