class RoomsController < ApplicationController
  def index
  end
  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
  
    render "index"
  end
end
