class UrlsController < ApplicationController
  def index
    @urls_time = Url.order("created_at DESC")
    @urls_popular = Url.order("count DESC")
  end

  def show
    @url = Url.find(params[:id])
    @url.increment_count
    redirect_to @url.long
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.create_short_url
    if @url.save
      redirect_to root_path
    else
      flash[:notice] = "Please re-enter url"
      redirect_to :back
    end
  end

  private

  def url_params
    params.require(:url).permit(:long)
  end
end
