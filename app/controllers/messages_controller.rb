class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  def index
    @user = current_user
    @message = Message.new
    @messages = @group.messages.includes(:user)

    respond_to do |format|
      format.any
      format.json { render json: @messages.map { |message| message.to_json } }
    end
  end

  def create
    @message = @group.messages.new(message_params)

    if @message.save
      respond_to do |format|
        format.any
        format.json do
         render json: @message.to_json
        end
      end
      flash[:notice] = "メッセージを送信しました。"
    else
      flash[:alert] = "メッセージを送信できませんでした。"
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
