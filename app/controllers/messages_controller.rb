class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  def index
    @user = current_user
    @message = Message.new
    @messages = @group.messages

    respond_to do |format|
      format.any
      format.json { render json: @messages.map { |message| message.to_json } }
    end
  end

  def create
    @message = @group.messages.new(message_params)

    if @message.save
      respond_to do |format|
        format.json { render json:
                      { message:
                        { nickname: current_user.nickname,
                          created_at: @message.created_at,
                          text: @message.text,
                          image: @message.image.url }}}
      end
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
