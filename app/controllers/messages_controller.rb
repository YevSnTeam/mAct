class MessagesController < ApplicationController
  
  def new
    @message = Message.new(:recipient_id => params[:recipient_id])
    unread_messages = current_user.received_messages.where(:sender_id => params[:recipient_id], :received => false)
    unread_messages.each do |msg|
      msg.update_attributes(:received => true)
    end
  end
  
  
  def create
    #raise params.inspect
    user = User.find(params[:message][:recipient_id])
    dialog = current_user.find_dialog_with(user)
    
    logger.debug "---------------------------------> DIALOG: #{dialog}"
    
    if dialog.nil?
      
      logger.debug "---------------------------------> DIALOG.NIL? => TRUE:   #{dialog}"
      
      @message = current_user.sent_messages.build(:recipient_id => params[:message][:recipient_id], :body => params[:message][:body], :dialog_id => nil)
      
      logger.debug "---------------------------------> Message: #{@message.attributes.inspect}"
      
    else dialog.dialog_id.nil?
      @message = current_user.sent_messages.build(:recipient_id => params[:message][:recipient_id], :body => params[:message][:body], :dialog_id => dialog.id)
    end
    unless @message.save
        flash[:notice] = "Nachricht konnte nicht gesendet werden"
    end  
    redirect_to new_message_path(:recipient_id => params[:message][:recipient_id])
  end
  
  def index
    @dialogs = current_user.all_dialogs   
  end
  
end
