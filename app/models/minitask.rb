# == Schema Information
#
# Table name: minitasks
#
#  id                  :integer          not null, primary key
#  title               :string
#  task_id             :integer
#  test_file           :text
#  starter_file        :text
#  difficulty          :integer
#  order               :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  instruction         :text
#  ppxmlfile           :text
#  allow_repeat        :integer
#  palette_start_index :integer
#
# Indexes
#
#  index_minitasks_on_task_id  (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.id)
#

class Minitask < ActiveRecord::Base
  belongs_to :task
  translates :title, :instruction, :test_file, :ppxmlfile
end
