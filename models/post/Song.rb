module Post
  class Song
    attr_accessor :song_artist, :song_title

    def artist(artist)
      @song_artist = artist
    end

    def title(title)
      @song_title = title
    end
 end 
end

