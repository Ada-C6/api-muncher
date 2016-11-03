module RecipesHelper

  def load_next_recipes(recipes, keyword, page, **kwargs)
    if recipes.length == 10
        link_to "", next_path(keyword: keyword, page: increment(page)), **kwargs
    end
  end

  def load_previous_recipes(keyword, page, **kwargs)
    if page > 1
      link_to "", next_path(keyword: keyword, page: decrement(page)), **kwargs
    end
  end

  def increment(item)
    item + 1
  end

  def make_pagination_links(recipes, keyword, page)
    return "" unless recipes > 10

    if page > 0
      link_to 'PREVIOUS PAGE', next_path(keyword: keyword, page: decrement(page))
    end
      link_to 'NEXT PAGE', next_path(keyword: keyword, page: increment(page))

  end

  def increment(item)
    item + 1
  end

  def decrement(item)
    item - 1
  end

end
