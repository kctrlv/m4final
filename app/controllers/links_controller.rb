class LinksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :require_login

  def index
    @links = current_user.links.all
    @hot_links = Link.hot
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find params[:id]

    if @link.update(link_params)
      redirect_to links_path
    else
      flash[:alert] = @link.errors.to_a
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
