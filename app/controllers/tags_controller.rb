class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    # @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @family = Family.find(params[:family_id])
    @tag = Tag.new(tag_params)
    @document = Document.find(params[:document_id])
    @tag.document = @document
    if @tag.save
      redirect_to family_documents_path(@family)
    else
      render "documents/show"
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
