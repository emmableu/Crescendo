# == Schema Information
#
# Table name: minitasks
#
#  id                  :integer          not null, primary key
#  task_id             :integer
#  test_file_en        :text
#  starter_file        :text
#  difficulty          :integer
#  order               :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  ppxmlfile_en        :text
#  allow_repeat        :integer
#  palette_start_index :integer
#  title_en            :string
#  instruction_en      :text
#  title_zh            :text
#  instruction_zh      :text
#  test_file_zh        :text
#  ppxmlfile_zh        :text
#
# Indexes
#
#  index_minitasks_on_task_id  (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.id)
#

require 'rails_helper'

RSpec.describe Minitask, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
