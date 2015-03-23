class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  rescue_from 'JSON::ParserError' do |exception|
           error_message = {error: "Could not decode request: JSON parsing failed"}
           render json: error_message, status: 400
  end


end
