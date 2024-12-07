class PicsController < ApplicationController
  include ActiveStorage::SetCurrent

  before_action :set_gallery, only: %i[ index ]

  # GET /galleries/:gallery_id/pics
  def index
    @pics = @gallery.pics
  end

  # GET /pics/:id
  def show
    @pic = Pic.find(params.expect(:id))
  end

  private

  def set_gallery
    @gallery = Gallery.includes(contents: { source_attachment: { blob: :variant_records } }).find(params.expect(:gallery_id))
  end
end
