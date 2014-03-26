class PagesController < ApplicationController

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

private
  def page_params
    params.require(:page).permit(:title, :content)
  end

end
