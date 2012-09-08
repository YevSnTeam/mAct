# == Schema Information
#
# Table name: friendships
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  approved   :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key => "friend_id"
  before_save :check_friend
 # before_save :default_values
  
  validates_uniqueness_of :user_id, :scope => [:friend_id]
  
    
  private
  
    # don't let the user add himself as a friend
    def check_friend
      self.user != self.friend
    end
    
    def default_values
      self.approved ||= false
    end
   
end
