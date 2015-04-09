class VideosController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @videos = Video.search_by_title(params[:q])
  end

end
