class NewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(index show)
  before_action :set_search_new
  before_action :load_new, only: %i(show edit update destroy)

  def index
    @news = @search.result.order_by_create_at
      .page(params[:page]).per Settings.page_size
  end

  def show; end

  def new
    @new = New.new
  end

  def create
    @new = New.new new_params
    ActiveRecord::Base.transaction do
      byebug
      @new.save!
      @new.attach_news_image params
    end
    flash[:success] = t "create_new_success"
    redirect_to news_index_path
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "not_create_success"
    render :new
  end

  def edit; end

  def update
    ActiveRecord::Base.transaction do
      @new.update! new_params
      @new.attach_news_image params
    end
    flash[:success] = t "news_updated"
    redirect_to news_index_path
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "update_failed"
    render :edit
  end

  def destroy
    if @new.destroy
      flash[:success] = t "new_deleted"
    else
      flash[:danger] = t "new_delete_failed"
    end
    redirect_to news_index_path
  end

  private

  def new_params
    params.require(:new).permit New::NEW_PARAMS
  end

  def load_new
    return if @new = New.find_by(id: params[:id])

    flash[:danger] = t "news_not_found"
    redirect_to news_path
  end

  def set_search_new
    @search = New.ransack params[:q]
  end
end
