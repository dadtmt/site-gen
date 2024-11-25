class PicsController < ApplicationController
  include ActiveStorage::SetCurrent

  before_action :set_gallery, only: %i[ index ]

  # GET /galleries/gallery_id/pics
  def index
    @pics = @gallery.pics
  end

  private

  def set_gallery
    @gallery = Gallery.includes(contents: { source_attachment: :blob }).find(params.expect(:gallery_id))
  end

end