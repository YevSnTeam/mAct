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
  belongs_to :wiki
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  attr_accessible :description, :wiki_id, :name
end
