# == Schema Information
#
# Table name: photos
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  photofile  :binary
#  enabled    :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  todo_id    :integer
#

class Photo < ActiveRecord::Base
  belongs_to :todo
  attr_accessible :enabled, :photofile, :title
end
