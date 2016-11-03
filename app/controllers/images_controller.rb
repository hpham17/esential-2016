class ImagesController < ApplicationController
  def create
    @image = Image.new image_params
    if @image.save
      render json: view_context.image_path(@image.location)
    end
  end

  private

  def image_params
    params.require(:image).permit(:location, :community_id)
  end
end
