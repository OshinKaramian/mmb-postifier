module Post
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
end

