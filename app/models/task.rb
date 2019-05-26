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
#
# Indexes
#
#  index_tasks_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

class Task < ActiveRecord::Base

  belongs_to :category
  has_one :description
  has_one :testscript
  accepts_nested_attributes_for :description
  # def script2test(script)
  #   test = script
  #   return test
  # end
  #
  # def create_test_file(test)
  #   self.test_file = test
  # end

end
