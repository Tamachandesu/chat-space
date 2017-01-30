class UsersController < ApplicationController

  def index
    @users = User.where('nickname LIKE ?', "%#{params[:nickname]}%")
    respond_to do |format|
      format.json { render json: @users}
    end
  end
end
