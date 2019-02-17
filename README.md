
## My personal project: Karma Bank is a positive affirmation app that logs your positive experiences and gives them out later to brighten up your day. 


- Created Rails backend API that gives out JSON containing an array of Karmas, each made of an entry for Karma and date.

- Created a front end app that has one main page for KARMA BANK and 2 buttons WITHDRAW and DEPOSIT.

- The button for WITHDRAW opens up vue modal containing a random quote from the axios request.

- The button for DEPOSIT opens up a vue modal containing an input form for taking in the users positive experience to be saved in the bank for future withdrawal.

- Handled CORS. Added my domain in the Origin and Resource of the config/initializers/cors.rb and added gem 'rack-cors'.

- Created a minified production build in the front end. Copied the dist folder to back-end public folder. Deployed it to Heroku.

- Designed the front end main app page.


_______


#### Next up: run build in front end to create the dist folder with index.html and static; put in backend/public. Push backend to heroku and run rake db:migrate.

_______

To run locally:

- navigate to backend and run rails s
- navigate to front end and run yarn serve