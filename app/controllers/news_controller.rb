class NewsController < ApplicationController
  before_action :load_new, only: :show

  def index
    @news = New.page(params[:page]).per Settings.new_page_size
  end

  def show; end

  private

  def load_new
    return if @new = New.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to news_path
  end
end
