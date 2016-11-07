# Recipe API Consumer

## Reflection
### What do you understand better after doing this project?
Obviously I have a better understanding as to what APIs are and how to use them, but that's only because I had no clue what they were a week ago. If that answer doesn't count, I feel like I understand using foundation for css a bit better than before.
### What do you want more practice with?
When to put something in a view vs the model vs the lib folder vs my controller. I keep taking the methodology of "well I put it here and it works now so I don't want to move it" but I'd really love to understand why it goes in a certain place.
### What is something you saw done differently?
My chair pair helped me A LOT last week as I rode the struggle bus. She had written her tests differently and wasn't really getting why some wouldn't pass. I struggled with that over the weekend but succeeded on a Saturday night (at my wild and crazy writing-tests-while-drinking-at-home-by-myself party). We talked about why Chris had originally written the Slack api code-along with the slack-key as a parameter to be passed into the search method (we had both taken that out of our recipe-api bc we figured no one would ever need to change the key and id), but after writing the tests it makes sense to put that back in and test for all those edge cases.

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
 
