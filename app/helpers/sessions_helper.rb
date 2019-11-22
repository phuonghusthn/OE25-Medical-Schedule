module SessionsHelper
  def log_in patient
    session[:patient_id] = patient.id
  end

  def remember patient
    patient.remember
    cookies.permanent.signed[:patient_id] = patient.id
    cookies.permanent[:remember_token] = patient.remember_token
  end

  def current_patient
    if patient_id = session[:patient_id]
      @current_patient ||= Patient.find_by id: patient_id
    elsif patient_id = cookies.signed[:patient_id]
      patient = Patient.find_by id: patient_id
      if patient&.authenticated?(:remember, cookies[:remember_token])
        log_in patient
        @current_patient = patient
      end
    end
  end

  def current_patient? patient
    patient&.== current_patient
  end

  def logged_in?
    current_patient.present?
  end

  def forget patient
    patient.forget
    cookies.delete :patient_id
    cookies.delete :remember_token
  end

  def log_out
    forget current_patient
    session.delete :patient_id
    @current_patient = nil
  end
end
