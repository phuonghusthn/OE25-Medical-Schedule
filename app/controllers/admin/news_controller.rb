class Admin::NewsController < Admin::BaseController
  before_action :load_new, only: %i(edit update destroy)
  load_and_authorize_resource :new

  def index
    @q = New.ransack params[:q]
    @news = @q.result.order_by_title
                  .page(params[:page]).per Settings.per_page
  end

  def new
    @new = New.new
  end

  def create
    @new = New.new new_params
    ActiveRecord::Base.transaction do
      @new.save!
      @new.images.attach(params[:new][:images])
    end
    flash[:success] = t "create_account_success"
    redirect_to admin_news_index_path
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "not_success"
    render :new
  end

  def edit; end

  def update
    ActiveRecord::Base.transaction do
      @new.update! new_params
      @new.images.purge
      @new.images.attach(params[:new][:images])
    end
    flash[:success] = t "new_updated"
    redirect_to admin_news_index_path
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "not_success"
    render :edit
  end

  def destroy
    if @new.destroy
      flash[:success] = t "new_deleted"
    else
      flash[:danger] = t "not_success"
    end
    redirect_to admin_news_index_path
  end

  private

  def new_params
    params.require(:new).permit New::NEW_PARAMS
  end

  def load_new
    return if @new = New.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to admin_news_index_path
  end
end
