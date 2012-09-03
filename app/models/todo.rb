# == Schema Information
#
# Table name: todos
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#  wiki_id     :integer
#  category_id :integer
#

class Todo < ActiveRecord::Base
  has_many :photos
  has_many :doings
  has_many :users, through: :doings
  belongs_to :category
  accepts_nested_attributes_for :photos
  validates :name, presence: true, uniqueness: true, length: { within: 5..30 }
  validates :category_id, presence: true
  attr_accessible :description, :name, :category_id
  
  
  
end
