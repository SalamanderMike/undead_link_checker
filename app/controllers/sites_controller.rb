class SitesController < ApplicationController

  def new
    @site = Site.new
    render :new
  end

  def create
    require 'open-uri'
    url = params.require(:site)[:url]
    site = Site.create(url: url)
    LinksWorker.perform_async(site.id)
    redirect_to site_path(site)
  end

  def show
    id = params[:id]
    @site = Site.find(id)
  end
end
