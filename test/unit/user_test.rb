# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  firstname       :string(255)
#  lastname        :string(255)
#  email           :string(255)
#  born            :date
#  city            :string(255)
#  enabled         :boolean
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
