# StreamCo Coding challenge

http://streamco-coding-challenge.herokuapp.com/

This challenge was completed with Ruby on Rails.

Also see http://robj.github.io for en example of Test Driven Development of a Versioned, RESTful API


## Application

Run with:

`# rails server`


`/Gemfile`

Additional gems used

request_exception_handler (rescue JSON Parsing errors)
curb (test broken JSON with raw requests)



`/config/routes.rb`

- Setup of root route (POST / -> ShowFilters create action)


`/app/controllers/application_controller.rb`

- JSON ParseError exception handling


`/app/controllers/show_filters_controller.rb`

- ShowFilter controller logic


`/app/models/show.rb`

- In a real world actual application, Shows, Images, Episodes etc. would all be ActiveRecord models with relational associations. For simplification in this challenge, the Show Model is a PORO (Plain Old Ruby Object)
- Some ActiveRecord features are emulated (initialization with hash, and typecasting to Integer (episodeCount) and Boolean (drm) )
- The Class method 'has_episodes_and_drm' would be the equivalant of a database scope (WHERE query).
- Also in a real world application the Instance method to_json would better be represented by a Serializer (eg. ActiveModelSerializers) to seperate presentation concerns.


## Tests

Run with:

` ruby -Itest test/integration/show_integration_test.rb `




`/test/minitest_helper.rb`

- Basic MiniTest setup and support

`/test/integration/show_integration_test.rb`

- Test sending the exact JSON example payload. NB JSON.parse in this test will add quotes to all values, loosing type information. TypeCasting is performed server side for neccessary fields.
- Test 400 error message on bad request 

`/test/example_payload.json`

- The example payload