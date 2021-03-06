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
    @group = Group.new(group_params)

    if @group.save
      redirect_to group_messages_path(@group), notice: 'チャットグループが作成されました'
    else
      redirect_to new_group_path, alert: 'チャットグループの作成に失敗しました'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'チャットグループが更新されました'
    else
      redirect_to edit_group_path(@group), alert: 'チャットグループの更新に失敗しました'
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end


