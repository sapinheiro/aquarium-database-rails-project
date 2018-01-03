# Aquarium Project 

## Dev Setup ##
Rails must be installed first. You can check if you have it with `rails --version`. If you don’t have it, you can install it from here: http://railsinstaller.org/en

Then, run the following in your terminal:

`cd aquarium_tycoon`

`bundle install`

`rake db:drop db:create db:migrate`
-If this step doesn’t work correctly then run ‘bin/rails db:migrate RAILS_ENV=development’, and try running the step again
- if your msql root is password protected, you may get an error on this step. If so - 
`cd config` 
Edit `database.yml` file - enter your password after “password:” on line 17

`cd ..`

`mysql -u root -p aquarium_tycoon_development < populateDatabase.sql`
	-If you get ‘mysql: command not found’, run ‘export PATH=${PATH}:/usr/local/mysql/bin/’ and run the previous step again

‘cd aquarium_tycoon’

‘rails server’

## Files of Note ##
Final Report.pdf - full final report

aquariumTycoonFullDatabaseScript.sql - contains schema, procedures, triggers, functions, and data for our project
