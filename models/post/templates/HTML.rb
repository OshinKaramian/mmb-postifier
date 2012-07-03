module Post_HTML
    def output_text
      s = "<b>Songs of the Week #{@title}</b><br />\n"
      @entries.each_with_index do |entry, i|
        s += build_entry_html(entry)      
      end
      return s
    end

    def build_entry_html(entry)
      s = "<b>#{entry.user_name}:</b><br />\n"
      s += "<a href=\"\">#{entry.user_song.song_artist} - #{entry.user_song.song_title}</a><br />\n"
      s += "<p><i>#{entry.entry_description.gsub(/\n/,"").gsub(/\t/, "").gsub(/\r/, "")}</i></p>\n"
      return s
    end
end
