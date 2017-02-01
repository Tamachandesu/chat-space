class UsersController < ApplicationController
  before_action :get_user, only: :index

  def index
    @users = User.where.not(nickname: @user.nickname).where('nickname LIKE ?', "%#{params[:nickname]}%")
    respond_to do |format|
      format.json { render json: @users}
    end
  end

  private
  def get_user
    @user = current_user
  end
end
