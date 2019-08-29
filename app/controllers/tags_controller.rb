class TagsController < ApplicationController
  def index
    @family = Family.find(params[:family_id])
    @document = Document.new
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
    @document = Document.find(params[:document_id])
    tags[:name].split.each { |tag_name| Tag.create(name: tag_name, document: @document) }
    if @document.tags.find_by(name: "untagged").present?
      @document.tags.find_by(name: "untagged").destroy
    end
    redirect_to family_document_path(@family, @document)
    # else
    #   render "documents/show"
    # end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @document = @tag.document
    @family = @tag.document.family
    @tag.destroy
    Tag.create(document: @document, name: "untagged") if @document.tags.count.zero?
    redirect_to family_document_path(@family, @document)
  end

  private

  def tags
    params.require(:tag).permit(:name)
  end
end
