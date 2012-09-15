# == Schema Information
#
# Table name: messages
#
#  id                   :integer         not null, primary key
#  sender_id            :integer
#  recipient_id         :integer
#  dialog_id            :integer
#  body                 :text
#  received             :boolean
#  deleted_by_sender    :boolean
#  deleted_by_recipient :boolean
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
