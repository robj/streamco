class Show

    attr_accessor :country
    attr_accessor :description
    attr_accessor :drm
    attr_accessor :episodeCount
    attr_accessor :genre
    attr_accessor :image
    attr_accessor :language
    attr_accessor :nextEpisode
    attr_accessor :primaryColour
    attr_accessor :seasons
    attr_accessor :slug
    attr_accessor :title
    attr_accessor :country
    attr_accessor :tvChannel


    # Class Methods


    def self.has_episodes_and_drm(shows)
        shows.select { |show| show.hasEpisodes? && show.hasDRM? }
    end



    # Instance Methods



    # initialize from hash like ActiveRecord

    def initialize args
        args.each do |k,v|
          instance_variable_set("@#{k}", v) unless v.nil?
        end
    end


    def hasEpisodes?
        self.episodeCount && (self.episodeCount > 0)
    end

    def hasDRM?
        self.drm
    end

    def to_json

        { image: self.image['showImage'],
          slug:  self.slug,
          title: self.title
        }

    end



end


