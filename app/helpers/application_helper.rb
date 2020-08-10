module ApplicationHelper
  def background_color
    case controller_name
    when 'sessions', 'passwords' then 'bg-dark'
    end
  end
end
