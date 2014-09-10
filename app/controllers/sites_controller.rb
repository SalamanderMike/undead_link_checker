class SitesController < ApplicationController
  require 'open-uri'


  def new
    @site = Site.new
    render :new
  end

  def create
    url_params = params.require(:site).permit(:url)
    site = Site.create(url_params)
    redirect_to site_path(site.id)
  end

  def show
    id = params[:id]
    @site = Site.find(id)
    @link = Array.new
    url = open(@site.url).read

    @page = Nokogiri::HTML(url)



  end
end
