class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by_name(params)
  end

  def new
    @family = Family.find(params[:family_id])
    @document = Document.find(params[:document_id])
    @tag = Tag.new
  end

  def create
    @family = Family.find(params[:family_id])
    @tag = Tag.new(tag_params)
    @document = Document.find(params[:document_id])
    @tag.document = @document
    if @tag.save
      redirect_to family_document_path(@family, @document)
    else
      render "documents/show"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @document = @tag.document
    @family = @tag.document.family
    @tag.destroy
    redirect_to family_document_path(@family, @document)
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
