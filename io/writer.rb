module Io
  class Writer

    def initialize(path)
      @file_path = path
      open_file
    end

    def write_line(output)
      #puts output to file
      @file.puts(output)
    rescue Exception => e
      close
      puts "Error while writting into the file"
      puts "Error message: " + e.message
    end

    def close
      @file.close
    end

    private
    def open_file
      @file = File.open(@file_path, "w")
    rescue Exception => e
      puts "Error while opening output file for writting"
      puts "Error message: " + e.message
    end
  end
end
