require "minitest_helper"

def app
    Rails.application
end


describe "Show integration" do

    

 it "should have expected response when POSTed example JSON payload" do 

        filename = Rails.root.to_s +  '/test/example_payload.json'
        file = File.read(filename)
        post_params = JSON.parse(file)


        post '/', post_params

        assert last_response.successful?
        assert last_response_json['response'].count.must_equal 7

        assert last_response_json['response'].first.has_key?('image')
        assert last_response_json['response'].first.has_key?('slug')
        assert last_response_json['response'].first.has_key?('title')


  end

  it "should return 400 status and error message when POSTed bad data" do


        #testing broken JSON requests with curb
        #https://robots.thoughtbot.com/catching-json-parse-errors-with-custom-middleware


        broken_json = '{asdf}'
        host = 'localhost'
        port = 3000
        path = '/'

        curb = Curl.post("http://#{host}:#{port}#{path}", broken_json) do |curl|
          curl.headers['Accept'] = 'application/json'
          curl.headers['Content-Type'] = 'application/json'
        end



        assert curb.response_code.must_equal 400 #bad_request
        assert curb.body_str.must_equal '{"error":"Could not decode request: JSON parsing failed"}'
        assert curb.content_type.must_match /application\/json/



  end



end