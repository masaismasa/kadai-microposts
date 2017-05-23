class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = User.find(params[:micropost_id])
    current_user.likek(micropost)
    flash[:success] = 'Postをライクしました。'
    #redirect_to user
  end

  def destroy
    micropost = User.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'Postのライクを解除しました。'
    #redirect_to user
  end
end
