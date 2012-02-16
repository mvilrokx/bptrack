module ApplicationHelper

  def pretty_date_time(dt, tz = "Pacific Time (US & Canada)", format = "%d-%b-%Y %H:%M")
    dt.in_time_zone(tz).strftime(format) if dt
  end

  def pretty_date(dt, format = "%d-%b-%Y")
    dt.strftime(format) if dt
  end

  def sortable(objects, column, title = nil)
    if objects.size != 0 then
      title ||= column.titleize
      css_class = column == sort_column(objects[0].class) ? "current #{sort_direction}" : nil
      direction = column == sort_column(objects[0].class) && sort_direction == "asc" ? "desc" : "asc"
      link_to title, {:sort_by => column, :direction => direction}, {:class => css_class}
    end
  end

end