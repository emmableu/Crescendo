# == Schema Information
#
# Table name: templates
#
#  id            :integer          not null, primary key
#  template_name :string
#  test_template :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Template < ActiveRecord::Base
end
