# == Schema Information
#
# Table name: messages
#
#  id                   :integer         not null, primary key
#  sender_id            :integer
#  recipient_id         :integer
#  dialog_id            :integer
#  body                 :text
#  received             :boolean
#  deleted_by_sender    :boolean
#  deleted_by_recipient :boolean
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'
  
  belongs_to :dialog, :class_name => 'Message', :conditions => { :dialog_id => nil }  # Reference to parent message; parent message has no parent message => nil
  has_many :replies, :class_name => 'Message', :foreign_key => 'dialog_id'
  
  before_save :check_recipient
  after_initialize :init
  
  validates :sender_id, :recipient_id, :body, presence: true

    
  def check_recipient
    self.sender != self.recipient
  end
  
  def init
    self.received = false if self.received.nil?
    self.deleted_by_sender = false if self.deleted_by_sender.nil?
    self.deleted_by_recipient = false if self.deleted_by_recipient.nil?
  end
  
end
