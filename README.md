
# My personal project: Karma Bank 

> Karma Bank is a positive affirmation app that logs your positive experiences and gives them out later to brighten up your day. 

# Project Photos.

![Karma App Image](https://drive.google.com/uc?export=view&id=1oTbaQL-ntxth8Wkzai3RQEy_AGbs2stJ)

![Karma App Image](https://drive.google.com/uc?export=view&id=1O0H77EW369JgD0A-vPOaL1zn9GE5EDpD)

# Feature Roadmap

- Created Rails backend API that gives out JSON containing an array of Karmas, each made of an entry for Karma and date.

- Created a front end app that has one main page for KARMA BANK and 2 buttons WITHDRAW and DEPOSIT.

- The button for WITHDRAW opens up vue modal containing a random quote from the axios request.

- The button for DEPOSIT opens up a vue modal containing an input form for taking in the users positive experience to be saved in the bank for future withdrawal.

- Handled CORS. Added my domain in the Origin and Resource of the config/initializers/cors.rb and added gem 'rack-cors'.

- Designed the front end main app page.

### Next up: 
Run build in front end to create a minified production build in the front end: create the dist folder with index.html and static; put in backend/public. Push backend to heroku and run rake db:migrate.

# Installation

To run locally:

- navigate to backend and run `rails s`
- navigate to front end and run `yarn serve`
- go to http://localhost:8080/ in your browser

# Author

Eliza Khachatryan