module ApplicationHelper
  def markdown(text)
    RedCloth.new(text).to_html.html_safe
  end

  def admin?
    current_user.admin
  end
end
