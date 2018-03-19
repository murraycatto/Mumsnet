# Mumsnet Readme

### System Requirements
* Postgres
* Ruby 2.2.2 or newer

### Setup

`git clone https://github.com/murraycatto/Mumsnet.git`

`cd Mumsnet`

`bundle install`

`rake db:create`

`rake db:migrate`

`rake db:seed`

`rails s`

### Testing 

If you are editing the tests I suggest using guard 
`guard`

To run all tests 
`bundle exec rspec`

## Admin portal

You will need to populate the CMS with some data in order to use the application.
The admin email and password are in the db/seeds.rb file
