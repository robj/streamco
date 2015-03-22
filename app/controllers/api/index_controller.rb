class Api::IndexController < ApplicationController


    protect_from_forgery :except => :create 


    def index
        render text: 'streamco coding challenge'
    end


    def create

        shows = params[:payload].map {|show_params| Show.new(show_params)}

        filteredShows =  Show.has_episodes_and_drm(shows)
        filteredShowsJSON = filteredShows.map { |show| show.to_json }

        render json: { response: filteredShowsJSON }


    end



end