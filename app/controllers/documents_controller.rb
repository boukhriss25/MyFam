class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :destroy]
  def index
    @family = Family.find(params[:family_id])
    @documents = Document.where(family_id: params[:family_id])
  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
  end

  def destroy
  end

  private
   def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:family_id, :user_id, :folder_id, :content, :doc_type)
end
