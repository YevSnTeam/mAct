class Photo < ActiveRecord::Base
  belongs_to :todo
  attr_accessible :enabled, :photofile, :title
end
