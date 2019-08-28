class PagesController < ApplicationController
  include FileHelper
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def media_home
    @family = Family.find(params[:family_id])
    @documents = @family.documents.select { |img| is_document?(img.content) }.sample(8)
    @images = @family.documents.select { |img| is_image?(img.content) }.sample(8)
    @tags = @family.tags.sample(4)
    @document = Document.new
  end
end
