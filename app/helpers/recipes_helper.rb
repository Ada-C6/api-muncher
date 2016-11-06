module RecipesHelper
  def total_pages(count)
    if count % 10 == 0
      @total_pages = count / 10
    else
      @total_pages = (count / 10) + 1
    end
  end
end
