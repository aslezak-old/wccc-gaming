class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :create, :update, :new]
  load_and_authorize_resource
  def index
    @about_page = Page.first
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
  @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to about_path
    else
      render 'edit'
    end
  end

  def show
  end

rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.message
end


private
  def page_params
    params.require(:page).permit(:title, :content)
  end

end
