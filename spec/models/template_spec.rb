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

require 'rails_helper'

RSpec.describe Template, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
