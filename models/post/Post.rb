module Post
  # This class takes in everything necessary from the .sotw file needed to build
  # the appropriate Post ruby object.
  class Post 
    attr_accessor :title, :description, :entries

    def initialize(title)
      @title = title
      @description = ""
      @entries = []
    end

    def self.create(title, &block)
      songOfTheWeek = self.new(title)
      songOfTheWeek.instance_eval(&block)
      songOfTheWeek
    end

    def description(content)
      @description = content
    end

    def entry(&block)
      entry = Entry.new
      entry.instance_eval(&block)
      @entries << entry
    end

    def print
      output_text
    end

    # This method must be overwritten by modules that get mixed in.
    # The output should be a template based on post information.
    def output_text 
      raise 'output_text is not defined.'
    end

    def to_s
      s = "Post\n\tTitle = #{@title}"
      s = s + "\tDescription - #{@description}\n"
      @entries.each_with_index do |entry, i|
        s = s + "\n\t#{entry.to_s}\n"
      end
      return s
    end
  end

  class Entry
    attr_accessor :user_name, :entry_description, :user_song 
   
    def name(entry_name)
      @user_name = entry_name
    end

    def description(entry_description)
      @entry_description = entry_description
    end

    def song(&block)
      song = Song.new
      song.instance_eval(&block)
      @user_song = song
    end
  end

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

