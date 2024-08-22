class DiscoverController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email)
  end
end