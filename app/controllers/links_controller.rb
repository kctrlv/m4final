class LinksController < ApplicationController
  before_action :require_login

  def index
    @links = current_user.links.all
    @hot_links = Link.hot
  end
end
