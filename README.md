Heroku Live: https://otter-muncher.herokuapp.com/

# Reflection

- What do you understand better after doing this project?
	- I learnt more about applying API to website, especially understanding on query parameters, and how this connects to our previous learning of model and database:
	- completed all search, search result and show features using API
	- filter search feature by health label and diet label using checkbox
	- manually coded pagination feature without use gem 
	   - Can show a 'sliding' pagination bar for previous 5 and next 5 pages to handle 1000+ results if needed. Knowing our developer account can only return a limited number of 100 recipes, I commented out this part for better user experience.
	   - When implement the +5 and -5 pagination bar, it is hard to stop pagination without reaching the last page because the API does not return a finite number for search result(1000 and more). 
	   - I will try to implement pagination gem next time as it seems to handle better on the above described last page pagination situation
	- change return recipe result to 9 per page for better display(which can be easily changed to any number in  PAGE_SIZE in api wrapper).
	- added API attribution in footer
	- foundation framework: responsive, pagination, label, table, checkbox, go back button, sea otter theme design.


- What do you want more practice with?
	- I need to practice more on: API and controller tesing, try more complex foundation grid(e.g. 5 recipes in a row), try pagination gem, and try Google Auth next time:
	- I did not attempt Google OAuth and save favorite feature this time due to time constrain. I did briefly think about how to implement these features. 
	    - Google OAuth: will be similar to Github OAuth. will be nice to go through it if has the opportunity.
	    - Save favorites: create user and favorites model. model relation: User has many favorites. I can save and access user & favorites by sessions[user_id].

	-  under construction: testing on API and controller. I will update and merge my testing branch later. 
	

- What is something you saw done differently?
My deskmate Jessica did great job on making the search bar available across pages, which definitely increases user experience. She also implemented api pigination gem for pages which I did not try this time. Her website also has very nice details like hover on recipe will change the recipe background color, etc.


# Recipe API Consumer

## Learning Goals:
- Configure an API for consumption
- Create authenticated API requests using HTTParty
- Consume JSON responses from an API
- Map response to application-specific data
- Separate API logic from application logic

## Purpose
Create a web application that will display recipes based on a search term. We will utilize an API from Edamam called the [Recipe Search API](https://developer.edamam.com/edamam-recipe-api).


### Baseline
Before you start writing _any_ code:

- Explore the API documentation to become familiar with the request(s) you can make
- If desired, create a Trello board to manage tasks

Once you've explored the API docs, this project:

- requires an individual **branch** and fork
- Use better_errors for debugging purposes
- requires you to create a Rails application
  - conform to Rails conventions on naming and inflection
  - by using `rails new .` you will create a new rails app _inside_ of the fork folder instead of creating a _new_ folder for your rails app
  
**You shall submit a pull request _with a meaningful pull request description_ once you are done with the baseline which shall be merged before moving onto implementing the requirements. _Do not push any additional code until your baseline PR has been merged_**


### Detailed Requirements  
**Search**:  
- The user shall type in a search term that will:
  - Make a request to the API using the search term
  - Display the results in a list to the user
  
**List View**:  
- This shall show a **paged** list of recipes for a given search term, _ten at a time_
- This view shall show the name of the recipe and the corresponding photo
- The view shall have a link from the recipe to a recipe show view

**Show View**:  
- This shall show the details about a given recipe. These details include:
  - Name
  - Link to the original recipe (opens in a new tab)
  - Ingredients
  - Dietary information
  
**Additional Requirements**:  
- One of the things that permits us to use this API, it providing attibution to the API's created. We must provide this somewhere on our site. Example locations include the footer or an about page. 
  - [Examples from the API site](https://www.dropbox.com/sh/ss34tnh4kyfxkxu/AADNJ_pB7Ou8_MVrYxgM4aQYa?dl=0&preview=Attribution+examples.pdf)
- You must also create tests for your API Wrapper & any classes as well as controller tests using VCR
- Your site must have a **responsive** look and feel, use semantic HTML as well as any grid formatting using Zurb Foundation

### Important Notes:
- Using this API as a developer limits the number of API calls in a month to 5000. This means that we must try to minimize API calls for testing purposes as much as possible, to ensure you do not exceed this number of API calls in the one week of development we have.


### Optional Requirements:
- Keep track of most recent search terms and allow user's to return to those searches
- Implement an OAuth strategy using Google
  - Allow users to save recipes to a "favorites" section that they can return to
-  Provide checkboxes or other controls to limit the search to options such as:
	-  Peanut Free
	-  Soy Free
	-  High Protein
	-  Etc
 
