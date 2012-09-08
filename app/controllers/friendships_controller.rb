# encoding: utf-8
class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id], :approved => false)
    if @friendship.save
      flash[:notice] = "Freundschaftsanfrage gesendet"
      redirect_to root_url
    else
      flash[:notice] = "Freund konnte nicht hinzugefügt werden"
      redirect_to current_user
    end  
  end
  
  def destroy
    if Friendship.find(params[:id]).user_id != current_user.id
      @friendship = current_user.inverse_friendships.find(params[:id])
    else
      @friendship = current_user.friendships.find(params[:id])
    end
    @friendship.destroy
    flash[:notice] = "Freund wurde entfernt"
    redirect_to current_user
  end
  
  def approve
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.update_attributes(:approved => true)
    flash[:notice] = "Du bist jetzt mit #{@friendship.user.fullname} befreundet"
    redirect_to current_user
  end
  
end