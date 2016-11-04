class CopyWriter

  def self.get_description(ingredients, source)

    option = rand(10)

    if option == 0
      description = "Whip up this delicious dish made of "
    elsif option == 1
      description = "Ingredients include "
    elsif option == 2
      description = "Start with "
    elsif option == 3
      description = "Enjoy the flavors of "
    elsif option == 4
      description = "Savor "
    elsif option == 5
      description = "A delightful combination of "
    elsif option == 6
      description = "Treat yourself to "
    elsif option == 7
      description = "Begin with "
    elsif option == 8
      description = "A recipe using "
    else option == 9
      description = "Flavorful "
    end

    counter = 0

    while counter < ingredients.length
      description << ingredients[counter]['food']
      description << ", "
      if counter == ingredients.length-2
        description << "and "
      end
      counter +=1
    end

    description.slice!(-1)
    description.slice!(-1)

    description << ". From #{source}."

    return description

  end

end
