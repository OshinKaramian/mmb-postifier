# Module that contains classes that perform queries to pull song information up
# from various platforms.
module Query
  require 'rubygems'
  require 'open-uri'
  require 'json'
 
  class Grooveshark
    def initialize(song)
      @song = song
    end

    def query
      return_uri = ""
      query_base_uri = "http://tinysong.com/b/"
      query_string = "#{@song.song_artist.gsub(" ", "+")}+#{@song.song_title.gsub(" ", "+")}"
      api_key = "67ed5786e15192f490e5e34f414ffbc1"

      query_full = "#{query_base_uri}#{query_string}?format=json&key=#{api_key}"
      track_response_json = URI.parse("#{query_full}").read
      track_hash = JSON.parse(track_response_json)
  
      # Walk the hash and find the uri for the matching song
      return track_hash["Url"].to_s
  
      return return_uri
    end
  end

  class Spotify
    def initialize(song)
      @song = song
    end

    def query
      return_uri = ""

      query_string = "#{@song.song_artist.gsub(" ", "+")}+#{@song.song_title.gsub(" ", "+")}"
      track_response_json = URI.parse("http://ws.spotify.com/search/1/track.json?q=#{query_string}").read
      track_hash = JSON.parse(track_response_json)
  
      # Walk the hash and find the uri for the matching song
      track_hash["tracks"].each_with_index do |track, i|
        if track["name"].to_s.downcase.include? @song.song_title.downcase
          return track["href"].to_s
        end
      end 
  
      return return_uri
    end
   end
end
