class VideosController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @video = current_user.videos.build if signed_in?
  end

  def create
    if remotipart_submitted?
      @video = current_user.videos.build(video_params)
      respond_to do |format|
        if @video.save
          format.js
          flash[:success] = "Your video has been successfully uploaded!"
          #redirect_to @current_user
        else
          render 'new'
        end
      end
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def destroy
    @video.destroy
    flash[:success] = "Video deleted successfully!"
    redirect_to @current_user
  end

  private

    def video_params
      params.require(:video).permit(:name)
    end

    def correct_user
      @video = current_user.videos.find_by(id: params[:id])
      redirect_to root_url if @video.nil?
    end
end
