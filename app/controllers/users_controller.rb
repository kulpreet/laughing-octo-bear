class UsersController < ApplicationController

  # before_filter :authenticate_user!
  doorkeeper_for :all   

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
