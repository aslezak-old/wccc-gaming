module ApplicationHelper
  def markdown(text)
    RedCloth.new(text).to_html.html_safe
  end
end
