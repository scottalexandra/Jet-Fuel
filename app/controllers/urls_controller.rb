class UrlsController < ApplicationController
  def index
    @urls = Url.all
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
