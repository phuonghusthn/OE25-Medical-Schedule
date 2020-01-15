module DoctorHelper
  def load_comments commentable
    commentable.comments.order_by_created_at
  end

  def can_delete_comment? comment
    current_user&.admin? || current_user&.id == comment.patient_id
  end

  def page_comment comments
    @comments = comments.order_by_created_at
                        .page(params[:page]).per Settings.page_size
  end

  def can_edit_doctor?
    current_user&.admin? || current_user&.staff?
  end

  def can_rate_doctor? current_user, doctor
    list_doctor = current_user&.appointments&.map {|appointment| appointment.doctor_id}

    return true if current_user&.patient? && list_doctor&.include?(doctor.id)

    return false
  end
end
