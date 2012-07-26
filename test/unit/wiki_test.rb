# == Schema Information
#
# Table name: wikis
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  todo_id    :integer
#  photo_id   :binary
#  content    :string(255)
#

require 'test_helper'

class WikiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
