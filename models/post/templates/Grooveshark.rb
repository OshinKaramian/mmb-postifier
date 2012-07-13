# Mixin Module that can be used to generate Grooveshark playlists.
module Post_Grooveshark
    def output_text
      grooveshark_track_uris= []
      contents = ""
      @entries.each_with_index do |entry,i|
       # grooveshark_track_uris << query_grooveshark(entry.user_song)
      end
      return grooveshark_track_uris.to_s
    end
   
    def build_playlist_html(tracks) 
    end
end

