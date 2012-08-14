# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  cname      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  todo_id    :integer
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
