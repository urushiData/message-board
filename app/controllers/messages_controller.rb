class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    
    if @message.save
      flash[:success] = 'Submitted Successfully'
      redirect_to @message
    else
      flash.now[:danger] = 'Failed to submit'
      render :new
    end
  end

  def edit
  end

  def update
    
    if @message.update(message_params)
      flash[:success] = 'Updated Successfully'
      redirect_to @message
    else
      flash.now[:danger] = 'Failed to update'
      render :edit
    end
  end
  
  def destroy
    @message.destroy
    
    flash[:success] = 'Deleted Successfully'
    redirect_to messages_url
  end
  
  private
  
  # 共通
  def set_message
    @message = Message.find(params[:id])
  end
      
  
  # Strong Parameter
  def message_params
    params.require(:message).permit(:content)
  end

end
