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

class Doing < ActiveRecord::Base
  attr_accessible :do, :done, :todo_id, :user_id
  belongs_to :user
  belongs_to :todo
  validates :todo_id, uniqueness: { scope: :user_id }
end
