# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  firstname           :string(255)
#  lastname            :string(255)
#  email               :string(255)
#  born                :date
#  city                :string(255)
#  enabled             :boolean
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  password_digest     :string(255)
#  remember_token      :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class User < ActiveRecord::Base
  has_many :doings
  has_many :todos, through: :doings
  
  
  has_many :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  
  has_many :friends, :through => :friendships, :conditions => { :'friendships.approved' => true }, :source => :friend
  has_many :inverse_friends, :through => :inverse_friendships, :conditions => { :'friendships.approved' => true }, :source => :user
  
  has_many :invited, :through => :friendships, :source => :friend, :conditions => { :'friendships.approved' => false }
  has_many :requested, :through => :inverse_friendships, :source => :user, :conditions => { :'friendships.approved' => false }
  
  
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "recipient_id"

  has_many :dialogs, :class_name => "Message", :conditions => { :dialog_id => nil }, :foreign_key => "sender_id" 
  has_many :inverse_dialogs, :class_name => "Message", :conditions => { :dialog_id => nil }, :foreign_key => "recipient_id"
  
  
  attr_accessible :firstname, :lastname, :email, :born, :city, :password, :password_confirmation, :avatar
  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: 'Fotoplatzhalter.jpg'
  has_secure_password
  
  before_save { |user| 
    user.email = email.downcase
    user.enabled = true
  }
  before_save :create_remember_token
  
  validates   :firstname, :lastname,  presence: true, 
                                      length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates   :email, presence: true, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  validates :password,  presence: true, 
                        length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def fullname
    self.firstname + " " + self.lastname 
  end
  
  # ==================================== Friendship ==================================== #
  
  def friend_with?(user)
    friends.include?(user) || user.friends.include?(self)
  end
  
  def find_any_friendship_with(user)
    friendship = Friendship.where(:user_id => self.id, :friend_id => user.id).first
    if friendship.nil?
      friendship = Friendship.where(:user_id => user.id, :friend_id => self.id).first
    end
      friendship
  end
  
  def invited?(user)
    friendship = find_any_friendship_with(user)
    return false if friendship.nil?
    friendship.friend == user
  end
  
  def got_request_from?(user)
      friendship = find_any_friendship_with(user)
      return false if friendship.nil?
      friendship.user == user
  end
  
  def all_friends
    friends + inverse_friends
  end
  
  def all_friendships
    friendships + inverse_friendships
  end
  
  # ================================= END Friendship ================================= #
  ######################################################################################
  
  # ==================================== Messages ==================================== #
  
  def find_dialog_with(user)
    dialog = Message.where(:sender_id => self.id, :recipient_id => user.id, :dialog_id => nil).first
    if dialog.nil?
      dialog = Message.where(:sender_id => user.id, :recipient_id => self.id, :dialog_id => nil).first
    end
    dialog
  end
  
  def all_dialogs
    dialogs + inverse_dialogs
  end
  # ================================== END Messages ================================== #
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
