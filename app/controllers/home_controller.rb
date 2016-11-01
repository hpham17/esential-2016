class HomeController < ApplicationController
  def index
  end
  def upload
    uploaded_io = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    render json: params[:file].original_filename
  end
end
