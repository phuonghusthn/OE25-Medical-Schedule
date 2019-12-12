module DoctorHelper
  def load_comments commentable
    commentable.comments.order_by_created_at
  end

  def check_user_to_delete comment
    current_user&.admin? || current_user&.id == comment.patient_id
  end

  def page_comment comments
    @comments = comments.order_by_created_at
                        .page(params[:page]).per Settings.page_size
  end
end
