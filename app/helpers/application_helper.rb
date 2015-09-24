module ApplicationHelper
  def nav_item_class(path)
    current_page?(path) ? 'active' : 'simple'
  end
end
