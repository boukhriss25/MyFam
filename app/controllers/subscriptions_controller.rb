class SubscriptionsController < ApplicationController
  def create
    @family = Family.find(params[:family_id])
    @conversation = Conversation.find(params[:conversation_id])
    @members = @family.users
    if params[:add_all]
      @members.each do |m|
        subs = Subscription.create(user: m, conversation: @conversation)
        # redirect_to edit_family_conversation_path(@family, @conversation)
      end
    elsif params[:add_user].nil?
      @subscription = Subscription.new(user: current_user)
    else
      @subscription = Subscription.new(user: User.find_by_email(params[:query]))
    end
    unless @subscription.nil?
      @subscription.conversation = @conversation
      @subscription.save
    end
    redirect_to edit_family_conversation_path(@family, @conversation)
  end

  def destroy
    # @family = Family.find(params[:family_id])
    @subscription = Subscription.find_by(user: params[:user].to_i, conversation_id: params[:id].to_i)
    @subscription.destroy
    redirect_to family_conversations_path(@subscription.conversation.family)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :conversation_id)
  end
end
