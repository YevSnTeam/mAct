# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  firstname       :string(255)
#  lastname        :string(255)
#  email           :string(255)
#  born            :date
#  city            :string(255)
#  enabled         :boolean
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  has_many :doings
  has_many :todos, through: :doings
  
  has_many :friendships
  has_many :friends, :through => :friendships
  
  
  attr_accessible :firstname, :lastname, :email, :born, :city, :password, :password_confirmation
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
  
  def friend_with?(user)
    friends.include?(user)
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
