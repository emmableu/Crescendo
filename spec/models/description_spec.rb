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

require 'rails_helper'

RSpec.describe Description, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
