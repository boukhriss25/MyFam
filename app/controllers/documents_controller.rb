class DocumentsController < ApplicationController
  include FileHelper
  before_action :set_document, only: [:show, :destroy]
  before_action :set_family, only: [:index, :show, :create, :destroy]

  def index
    if params[:query].present?
      @tags = Tag.where(name: params[:query])
      @documents = @tags.map { |t| t.document }
    else
      @documents = Document.where(family_id: params[:family_id])
    end

    if params[:type].present?
      @documents = @family.documents.select { |doc| send("is_#{params[:type]}?", doc.content) }
    end
    @document = Document.new
  end

  def show
    @tag = Tag.new
    @message = Message.new
    @subscriptions = Subscription.where(user: current_user).select do |subsc|
      Conversation.find(subsc.conversation_id).family_id == @family.id
    end
    @conversations = @subscriptions.to_a.map {|sub| sub = sub.conversation}

  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user
    @document.family = @family
    if @document.save
      redirect_to new_family_document_tag_path(@family, @document)
    else
      @documents = Document.where(family_id: params[:family_id])
      render :index
    end
  end

  def destroy
    @document.destroy
    redirect_to family_home_media_path(@family)
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def set_family
    @family = Family.find(params[:family_id])
  end

  def document_params
    params.require(:document).permit(:family_id, :user_id, :folder_id, :content, :content_cache, :doc_type)
  end
end
