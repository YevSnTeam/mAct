class Category < ActiveRecord::Base
  has_many :todos
  attr_accessible :cname
end
