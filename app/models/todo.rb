# == Schema Information
#
# Table name: todos
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#  wiki_id     :integer
#

class Todo < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  attr_accessible :description, :name
end
