class ImagesController < ApplicationController
  def create
    @image = Image.new image_params
    @image.community_id = current_user.community.id
    if @image.save
      render json: view_context.image_path(@image.location)
    end
  end

  private

  def image_params
    params.require(:image).permit(:location)
  end
end
