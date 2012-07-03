module Post_Spotify
    require 'rubygems'
    require 'open-uri'
    require 'json'
   
    def output_text
      spotify_track_uris = []
      contents = ""
      @entries.each_with_index do |entry,i|
        spotify_track_uris << query_spotify(entry.user_song)
      end
      return spotify_iframe_html(spotify_track_uris) 
    end
   
    def spotify_iframe_html(tracks)
      iframe_html = "<iframe src=\"https://embed.spotify.com/?uri=spotify:trackset:PREFEREDTITLE:"
      tracks.each_with_index do |track, i|
        iframe_html += "#{track.split(":")[2]}"
        if i != tracks.length - 1
           iframe_html += ","
        end
      end
      iframe_html += "\" frameborder=\"0\" allowtransparency=\"true\"></iframe>"
    end

    def query_spotify(song)
      return_uri = ""

      query_string = "#{song.song_artist.gsub(" ", "+")}+#{song.song_title.gsub(" ", "+")}"
      track_response_json = URI.parse("http://ws.spotify.com/search/1/track.json?q=#{query_string}").read
      track_hash = JSON.parse(track_response_json)
  
      # Walk the hash and find the uri for the matching song
      track_hash["tracks"].each_with_index do |track, i|
        if track["name"].to_s.downcase == song.song_title.downcase
          return track["href"].to_s
        end
      end 
  
      return return_uri
    end
end

