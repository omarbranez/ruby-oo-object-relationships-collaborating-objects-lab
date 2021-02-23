class Artist
    attr_accessor :name, :song
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
        #     song = self.create 
        #     song.artist = song_name 
        #     song 
        # else 
        #     self.find_by_name(name_query) 
        # end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end