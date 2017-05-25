class Relationship2sController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_micropost, only: [:destroy]
  before_action :correct_user, only: [:destroy]

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'Postをライクしました。'
    redirect_to :back
  end

  def destroy
    p "***********************"
    p params[:micropost_id]
    p params[:id]
    current_user.unlike(@micropost)
    flash[:success] = 'Postのライクを解除しました。'
    redirect_to :back
    
  end
  
  private

  def set_micropost
    @micropost = current_user.likings.find_by(id: params[:micropost_id])
  end

  def correct_user
    redirect_to root_path if !@micropost
  end
end
