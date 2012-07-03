module Post
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
end

