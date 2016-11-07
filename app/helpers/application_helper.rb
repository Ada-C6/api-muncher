module ApplicationHelper

  # only show previous page button if current page is > 1
  def page_navigation_previous
    if @page.to_i > 1
      @page_num = -1
      return true
    end
  end

  # only show next page button if there are additional pages of recipes
  def page_navigation_next
    # check if @recipes == [] so that if a page number too large is manually entered they will be redirected
    if @recipes == [] || @page.to_i * 10 < @recipes.last.count
      @page_num = 1
      return true
    end
  end

end
