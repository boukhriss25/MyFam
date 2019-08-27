class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def media_home
    @family = Family.find(params[:family_id])
    @documents = @family.documents
    @tags = @family.tags
    @document = Document.new
  end
end
