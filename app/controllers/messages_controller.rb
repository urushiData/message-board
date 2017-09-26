class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
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
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    
    if @message.update(message_params)
      flash[:success] = 'Updated Successfully'
      redirect_to @message
    else
      flash.now[:danger] = 'Failed to update'
      render :edit
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    
    flash[:success] = 'Deleted Successfully'
    redirect_to messages_url
  end
  
  private
  # Strong Parameter
  def message_params
    params.require(:message).permit(:content)
  end

end
