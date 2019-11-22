module ApplicationHelper
  def full_title page_title = ""
    base_title = I18n.t "app_name"
    page_title ? (page_title + " | " + base_title) : base_title
  end
end
