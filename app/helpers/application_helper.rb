module ApplicationHelper
  def current_year
    # The new seasons starts on 8/1 so technically, it's the previous year through 7/31
    current_date = Time.now
    if current_date.month < 8
      current_date.year - 1
    else
      current_date.year
    end
  end

  def current_year_footer
    # for the copyright because otherwise this would be off
    Time.now.year
  end
  
  def kramdown(text)
    return sanitize Kramdown::Document.new(text).to_html
  end
  
  def current_day
    return @current_day = Time.now.strftime("%A")
  end
 
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
