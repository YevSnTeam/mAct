# == Schema Information
#
# Table name: todos
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

class Todo < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
end
