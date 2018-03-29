class MessageController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def new
    if params[:back]
        @message = Message.new(message_params)
        @id = @message.achievement_id
        @achievement = Achievement.find(@id)
    else
        @achievement = Achievement.find(params[:id]) #ここをmessageモデルからとれるようにしておく confirmにも引数を与えられるようにしておく？
        @message = Message.new
    end
  end

  def edit
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to  list_achievement_index_path
    else
      render "new"
    end  
  end
  
  def update
    if @message.update(message_params2)
        redirect_to list_achievement_index_path
    else
        render "edit"
    end    
  end  
  
  def destroy
    @message.destroy
    redirect_to list_achievement_index_path    
  end
  
  def confirm
    @message = Message.new(message_params)
    render "new" if @message.invalid?    
  end
  
  private
  def message_params
    params.require(:message).permit(:achievement_id, :message)
  end
  
  def message_params2
    params.require(:message).permit(:message)
  end    
  
  def set_message
    @message = Message.find(params[:id])
  end
  
end
