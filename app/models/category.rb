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
  has_many :todos
  attr_accessible :cname
end
