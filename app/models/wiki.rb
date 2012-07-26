# == Schema Information
#
# Table name: wikis
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  todo_id    :integer
#  photo_id   :binary
#  content    :string(255)
#

class Wiki < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :todos
  
end
