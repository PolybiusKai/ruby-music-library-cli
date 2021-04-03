class Artist

    extend Concerns::Findable
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all 
        @@all 
    end

    def self.destroy_all
        self.all.clear 
    end

    def save 
        self.class.all << self 
    end

    def self.create(name)
        artist = new(name)
        artist.save
        artist
    end

    #Returns the artist's 'songs' collection (artist has many songs)
    def songs 
        Song.all.select { |s| s.artist == self }
    end

    def add_song(song)
        song.artist = self unless song.artist
    end

    def genres
        songs.collect {|s| s.genre}.uniq
    end
end
