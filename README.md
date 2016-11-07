# Recipe API Consumer

### Reflection:
What do you understand better after doing this project?

* I understand API's (both what they are and how they work) much better. I also understand how to make a site responsive using foundation much better and what to test for (although I still want to add some more assertions to my test). In addition, while I didn't include it in the final product (because the API didn't allow filtering based all health categories - I believe that was a premium package thing) I added in the functionality which helped me get experience with searching and filtering logic. 

What do you want more practice with?

* I want more practice with testing (I feel like I can do it but it's not as thourough or as fast a process as I'd like it to be). I also woud love to have a better understanding of how the structure of a rails project is set up. I have a good grasp of the MVC framework and the helpers that go along with them, but don't have a complete understanding of how the lib folder fits in and what to put in there.

What is someting you saw done differently?

* Using URI.escape to get the right format for a uri (I used gsub instead which seems more makeshift).



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
 

