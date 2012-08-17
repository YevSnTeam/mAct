class Doing < ActiveRecord::Base
  attr_accessible :do, :done, :todo_id, :user_id
  belongs_to :user
  belongs_to :todo
end
