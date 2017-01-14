class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  def index
    @user = current_user
    @message = Message.new
    @messages = @group.messages
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      redirect_to group_messages_path(@group), notice: 'メッサージを入力してください'
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
