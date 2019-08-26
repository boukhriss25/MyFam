class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :destroy]
  def index
    @family = Family.find(params[:family_id])
    @documents = Document.where(family_id: params[:family_id])
    @document = Document.new
  end

  def show
    @tag = Tag.new
    @family = Family.find(params[:family_id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @family = Family.find(params[:family_id])
    @document.user = current_user
    @document.family = @family
    if @document.save
      redirect_to family_document_path(@family, @document)
    else
      @documents = Document.where(family_id: params[:family_id])
      render :index
    end
  end

  def destroy
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:family_id, :user_id, :folder_id, :content, :content_cache, :doc_type)
  end
end
