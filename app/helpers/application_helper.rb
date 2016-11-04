module ApplicationHelper
  def year_range(start_year)
  # In case the input was not a number (nil.to_i will return a 0)
  start_year = start_year.to_i

  current_year = Time.now.year

    if current_year > start_year && start_year > 2000
      "#{start_year} - #{current_year}"
    elsif start_year > 2000
      "#{start_year}"
    else
      "#{current_year}"
    end
  end
end
