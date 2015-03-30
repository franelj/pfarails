class Api::V1::ChatController < Api::V1::ApplicationController
  def list_rooms
    render json: current_user.chat_rooms.order(updated_at: :desc)
  end

  def new_message
    check_params_keys_presence :room_id, :message
    @room = ChatRoom.find(params[:room_id])
    render_json_error 401, "Vous ne participez pas à cette conversation" unless @room.users.include? current_user
    @chat_message = ChatMessage.new(chat_room: @room, message: params[:message], user: current_user)
    if @chat_message.save
      render json: @room.chat_messages
    else
      render_json_error 400, @chat_message.errors.full_messages.first
    end
  end

  def list_messages
    check_params_keys_presence :room_id
    @room = ChatRoom.find(params[:room_id])
    render json: @room.chat_messages.order(created_at: :asc)
  end
end
