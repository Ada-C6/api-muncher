# Reflection 

I understand more about how to look at an APIs documentation and then use that API in a project.  However, I definitely still lack confidence in my ability to do this with a different API.  I felt like I struggled to apply what I learned during the lectures in the project this week, probably because it wasn't a situation where I could directly apply what I was shown.  Completing the assignment made me realize that I did not have a deep or broad level of understanding from the API lectures, and as a result I couldn't just expand upon them with a new API.  I do feel more comfortable approaching my next API project though, and I have a feeling with each new implementation of this idea, it will get easier. 

I need more practice with approaching different APIs and using them to add features to a website.  A couple of the features (specifically the show page, and how to use the URIs as IDs) were really tricky for me to approach alone, and I worked with others in addition to TAs to get these features working.  This was really helpful to do as a team, and to be honest, I don't think I could have figured it out alone.  I'm not sure if that was the idea on this project or not, but that is what I needed to do.  

I really enjoyed seeing other projects.  It was cool to see Briana's feature of having numbers (1-10) at the bottom of a page instead of just a "More Results" button.  I liked Alyssa's use of different OAuth accounts.  I think the group show-and-tell time is always great, because I learn a lot from seeing how someone else implemented a feature. 


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
  - ingredientLines
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
	-  High Protien
	-  Etc
 
