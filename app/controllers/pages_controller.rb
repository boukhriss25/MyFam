class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def media_home
    @family = Family.find(params[:family_id])
    @documents = Document.where(family_id: params[:family_id])
    @tags = []
    @documents.each do |doc|
      doc.tags.each do |tag|
        @tags.push << tag.name
      end
    end
    @tags = @tags.uniq
    @document = Document.new
  end
end
