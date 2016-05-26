class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]
  before_action :set_category, only: [:index]

  def index
    if @category
      @videos = @category.videos
    else
      @videos = Video.all
    end

    if params[:location]
      @videos = @videos.where(location: params[:location])
    end
    @videos = @videos.where(id: params[:ids]) if params[:ids]
    respond_with @videos
  end

  def show
    respond_with @video
  end

  def create
    video = Video.create(video_params)
    respond_with video
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    respond_with @video
  end

  def destroy
    @video.destroy
    head :no_content
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id]) if params[:category_id]
    end

    def video_params
      params.require(:video).permit(:title, :location, {:category_ids => []})
    end
end
