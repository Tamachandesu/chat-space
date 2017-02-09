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
      redirect_to json: {message:
                            {text: @message.text,
                            image: @message.image.url}}
    else
      format.html {redirect_to group_messages_path(@group), alert: 'エラーが発生しました'}
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
