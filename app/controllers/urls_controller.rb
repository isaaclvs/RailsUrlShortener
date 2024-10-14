class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url
    else
      render :new
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def redirect_to_original
    url = Url.find_by(short_url: params[:short_url])
    redirect_to url.original_url, allow_other_host: true if url
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end


