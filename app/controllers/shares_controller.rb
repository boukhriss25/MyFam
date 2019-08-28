class SharesController < ApplicationController
  def index
    @family = Family.find(params[:family_id])
    @conversation = Conversation.find(params[:conversation_id])
    @shares = Share.where(conversation: params[:conversation_id])
  end

  def new
  end

  def create
  end

  def destroy
  end

  private


end
