require "minitest_helper"

def app
    Rails.application
end


describe "Show integration" do

  it "expected response when POSTed example JSON payload" do 

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

end