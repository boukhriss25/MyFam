class SubscriptionsController < ApplicationController

  def create
    @family = Family.find(params[:family_id])
    @conversation = Conversation.find(params[:conversation_id])
    @subscription = Subscription.new(user: current_user)
    @subscription.conversation = @conversation
    if @subscription.save
      redirect_to family_conversation_path(@family, @conversation)
    end
  end

  def destroy
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :conversation_id)
  end
end
