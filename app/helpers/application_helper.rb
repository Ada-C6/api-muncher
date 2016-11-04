module ApplicationHelper

  def page_navigation_previous
    if @page.to_i > 1
      @page_num = -1
      return true
    end
  end

  def page_navigation_next
    # Check to see if there should be additional pages of recipes based on count
    if @recipes == [] || @page.to_i * 10 < @recipes.last.count
      @page_num = 1
      return true
    end
  end

end
