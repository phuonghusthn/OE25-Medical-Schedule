module ApplicationHelper
  def full_title page_title = ""
    base_title = I18n.t "app_name"
    page_title ? (page_title + " | " + base_title) : base_title
  end

  def check_auth_controller?
    %w(patients sessions).include?(controller.controller_name) &&
      controller.action_name == "new"
  end
end
