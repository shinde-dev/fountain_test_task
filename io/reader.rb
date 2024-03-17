module Io
  class Reader
    def initialize(path)
      @file_path = path
      open_file
    end

    def next_line
      @file.readline
    rescue Exception => e
      close
      return nil
    end

    def close
      @file.close
    end

    private
    def open_file
      @file = File.open(@file_path, "r")
    rescue Exception => e
      puts "Error while opening input file for reading"
      puts "Error message: " + e.message
    end
  end
end

