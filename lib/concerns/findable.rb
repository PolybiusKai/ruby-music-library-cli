module Concerns::Findable
    #finds a song instance in @@all by the name property of the song
    def find_by_name(name)
        self.all.detect {|s| s.name == name}
    end

    def find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end
end
