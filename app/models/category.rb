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

class Category < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :todos
  validates :name, presence: true, uniqueness: true
end
