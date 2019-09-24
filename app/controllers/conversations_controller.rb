class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  def index
    @family = Family.find(params[:family_id])
    @conversations = Conversation.where(family_id: params[:family_id])
    @subscription = Subscription.new
    subscriptions = Subscription.where(user: current_user).select do |subsc|
      Conversation.find(subsc.conversation_id).family_id == @family.id
    end
    sorted_subs = subscriptions.sort_by { |subs| subs.conversation.messages.last.created_at }
    @subscriptions = sorted_subs.reverse
  end

  def show
    @messages = Message.where(conversation_id: params[:id])
    @family = @conversation.family
    @message = Message.new
    @subscription = Subscription.find_by(conversation: @conversation, user: current_user)
    @subscription.update(last_seen: DateTime.now)
    @colors = ["lightsalmon",
               "salmon",
               "darksalmon",
               "lightcoral",
               "indianred",
               "crimson",
               "firebrick",
               "red",
               "darkred",
               "coral",
               "orangered",
               "darkorange",
               "darkkhaki",
               "limegreen",
               "forestgreen",
               "darkgreen",
               "yellowgreen",
               "lightgreen",
               "darkseagreen",
               "mediumseagreen",
               "seagreen",
               "olive",
               "darkolivegreen",
               "olivedrab",
               "mediumaquamarine",
               "mediumturquoise",
               "darkturquoise",
               "cadetblue",
               "darkcyan",
               "steelblue",
               "royalblue",
               "blue",
               "mediumblue",
               "darkblue",
               "midnightblue",
               "mediumslateblue",
               "slateblue",
               "darkslateblue",
               "mediumorchid",
               "mediumpurple",
               "blueviolet",
               "darkviolet",
               "darkmagenta",
               "indigo",
               "mediumvioletred",
               "palevioletred",
               "darkslategray",
               "lightslategray",
               "peru",
               "saddlebrown",
               "sienna",
               "maroon"]
    @conversation.users.each { |u|
      u.color = @colors.sample
      u.save
       }
  end

  def new
    @family = Family.find(params[:family_id])
    @conversation = Conversation.new
  end

  def create
    @family = Family.find(params[:family_id])
    @conversation = Conversation.new(conversation_params)
    @conversation.family = @family
    @subscription = Subscription.new(user: current_user, conversation: @conversation)
    if @subscription.save && @conversation.save
      redirect_to edit_family_conversation_path(@family, @conversation)
      # skipform: params[:skipform]
    else
      render :new
    end
  end

  def send_media_to_conversation
    redirect_to new_family_conversation_message
  end

  def edit
    @users = @conversation.users
    @family = Family.find(params[:family_id])
    @members = @family.users
    @documents = @conversation.documents
  end

  def update
    @conversation.update(conversation_params)
    redirect_to family_conversation_path(@conversation)
    # skipform: params[:skipform]
  end

  def destroy
    @conversation.destroy
    redirect_to family_conversations_path(params[:family_id])
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:name, :family_id, :avatar)
  end
end
