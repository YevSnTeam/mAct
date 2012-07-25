# == Schema Information
#
# Table name: wikis
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  todo_id    :integer
#  photo_id   :binary
#

class Wiki < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :todo_id
  validates :todo_id, presence: true
  belongs_to :todo
end
