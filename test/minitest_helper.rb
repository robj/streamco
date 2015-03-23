ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require "active_support/testing/setup_and_teardown"
require "rack/test"



class MiniTest::Spec
 
  include Rails.application.routes.url_helpers
  include Rack::Test::Methods
  
  before :each do
  end
 
  after :each do
  end

  def last_response_json
    JSON.parse(last_response.body)
  end
 
end