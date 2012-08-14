# == Schema Information
#
# Table name: photos
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  photofile  :binary
#  enabled    :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  todo_id    :integer
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
