# == Schema Information
#
# Table name: doings
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  todo_id    :integer
#  done       :boolean
#  do         :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class DoingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
