# Welcome to ScalpMaster!
A CLI app made by Jake Mills and Victor Scholz

For our Mod1 Final Project we developed a ticket reservation app using the TicketMaster API. In this application the user can login or create a new profile and then access the available events. The user is able to search by venue, have events suggested to them, or show all events nearby. From there the user can reserve a ticket to pick up at the box office!


# Install Instructions
- Follow these steps below within your terminal.

1. Migrate all tables by typing in 'rake db:migrate' into your terminal.
2. Run seed database file by typing in 'rake db:seed' to get all user and event data.
3. Once all the data is loaded, run the run file by typing in 'ruby bin/run.rb'
4. Interact with the application using the command line.
5. HINT: Most commands needed are contained within single quotes ('example')
6. Have fun! And thanks for using ScalpMaster :)

# Contributor’s Guideline
1. 'Log in' or create a profile with 'sign up' (you will need a correct case sensitive password).
  - 'Log in' accesses a User who's profile is already saved in the database.
  - 'Sign up' allows the User to create a new profile and is then saved in the database.

2. After successful login, you will be shown the welcome page. This is where you can 'view events' or 'view profile'. Different outcomes happen depending upon selection.
  - 'View events' will bring the user to the events page.
  - 'View profile' will bring the user to their profile page.

3. If 'view profile' is selected the user's profile page displays these options:
  - 'user info' displays the user's profile information (without their password) and then brings them back to the welcome page.
  - 'reserved tickets' will do one of two options
    - If the user does not have any reserved tickets, they are told they don't have any tickets and are given the option to search and reserve tickets.
      - If yes is selected, the user is brought to the events page.
      - If no is selected, the user is brought back to the welcome page.
    - If the user does have reserved tickets, their reservations are displayed and they are brought back to the welcome page.
  - 'log out' will display exit message, log the user out, and end the application.

4. If 'view events' is selected the user will be brought to the events page with the following options:
  - 'search events' SEE STEP 5
  - 'suggest events' SEE STEP 6
  - 'events nearby' SEE STEP 7
  - 'log out' will display exit message, log the user out, and end the application.

5. Search Events provides the following options:
  - 'venue' provides a list of all available venue names and asks the user to respond with the venue name they would like to search.
    - Upon entering a venue name on the list correctly, the user will be shown all events and their dates at that particular venue. Following the displayed events, these options will be available:
      - 'reserve' SEE STEP 8
      - 'search' will allow the user to search another venue.
      - 'start over' will bring the user back to the events page.
  - 'event name' provides a list of all available event names and asks the user to respond with the event name they would like to search.
    - Upon entering an event name on the list correctly, the user will be shown all events and their dates of that particular event name. Following the displayed events, these options will be available:
      - 'reserve' SEE STEP 8
      - 'search' will allow the user to search another event name.
      - 'start over' will bring the user back to the events page.
  - 'events' provides a list of all available events, their dates, and full venue information. Following the displayed events, these options will be available:
    - 'reserve' SEE STEP 8
    - 'start over' will bring the user back to the events page.

6. Suggest Events will provide a random sample of three events and all their available data within the events database. Following the displayed options the user can choose:
  - 'reserve' SEE STEP 8
  - 'start over' will bring the user back to the events page.

7. Events Nearby will display event names and dates where the venue postal code matches the user's postal code. Following the displayed options the user can choose:
  - 'reserve' SEE STEP 8
  - 'start over' will bring the user back to the events page.

8. Reserve will ask the user to provide the date of the particular event the user would like to reserve. Upon entering a correct date, the user will be asked if the event they selected is the one they truly want to reserve, with the full event information being displayed. Then, the user is provided with the following options:
  - 'yes' will ask the user how many tickets they would like to reserve. Upon entering a number a new ticket reservation will be created. The user will then see the message 'Enjoy the show!' and be brought back to the welcome page. (The new ticket reservation now joins the user and the event, and can be displayed under reserved tickets for this particular user.)
  - 'search again' will bring the user back to the events page.

9. If user chooses 'log out', you must enter 'ruby bin/run.rb' to begin application again.

# License


# Module One Final Project Guidelines

Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

  **Resource:** [Easy Access APIs](https://github.com/learn-co-curriculum/easy-access-apis)

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate classes for your models and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. For example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributor's guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project. (2 minutes max)
6. Prepare a presentation to follow your video. (3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address what, if anything, you would change or add to what you have today.
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```
