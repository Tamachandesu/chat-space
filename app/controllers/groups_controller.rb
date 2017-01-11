class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @user = current_user
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    Group.create(group_params)
    redirect_to :root and return
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to group_messages_path(@group)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end


