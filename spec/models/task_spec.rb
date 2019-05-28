# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  title          :string
#  category_id    :integer
#  test_file      :text
#  starter_file   :text
#  difficulty     :integer
#  order          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  instruction    :text
#  correctscript  :text
#  scriptarray    :text
#  scriptarraytwo :text
#  ppxmlfile      :text
#  scriptorder    :text
#
# Indexes
#
#  index_tasks_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
