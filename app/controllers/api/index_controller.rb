class Api::IndexController < ApplicationController


    protect_from_forgery :except => :create 


    def index
        render text: 'streamco coding challenge'
    end


    def create

        shows = params[:payload].map {|show_params| Show.new(show_params)}

        filtered_shows =  Show.has_episodes_and_drm(shows)
        filtered_shows_json = filteredShows.map { |show| show.to_json }

        render json: { response: filtered_shows_json }


    end



end