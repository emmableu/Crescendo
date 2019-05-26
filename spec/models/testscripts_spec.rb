# == Schema Information
#
# Table name: testscripts
#
#  id          :integer          not null, primary key
#  task_id     :integer
#  scriptarray :string           default([]), not null, is an Array
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

require 'rails_helper'

RSpec.describe Testscript, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
