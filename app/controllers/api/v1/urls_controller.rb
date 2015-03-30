class Api::V1::UrlsController < ApplicationController
  respond_to :json

  def index
    respond_with Url.all
  end

  def create
    respond_with Url.create(url_params)
  end

  def destroy
    respond_with Url.destroy(params[:id])
  end

  private

  def url_params
    params.require(:url).permit(:long)
  end

end
