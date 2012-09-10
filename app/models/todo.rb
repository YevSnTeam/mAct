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
#

class Todo < ActiveRecord::Base
 
  has_many :photos
  has_many :doings
  has_many :users, through: :doings
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :categories, :reject_if => lambda { |a| a[:cat].blank? }

  validates :name, presence: true, uniqueness: true, length: { within: 5..30 }
 
  attr_accessible :description, :name 
  
  
  
  
  
end
