# Mixin Module that can be used to generate Grooveshark playlists.
module Post_Spotify
    def output_text
      spotify_track_uris = []
      contents = ""
      @entries.each_with_index do |entry,i|
        spotify_track_uris << Query::Spotify.new(entry.user_song).query
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
end

