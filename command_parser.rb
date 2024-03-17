class CommandParser
  class << self
    def parse(input)
      input = input.split(" ")
      command = get_command(input.first)
      #Pass input to command by exclusing command name
      command.new(input[1..input.length])
    end

    private
    def get_command(string)
      Object.const_get "Command::#{string.capitalize}"
    rescue Exception => e
      puts "Exception while parsing command"
      puts "Error message: " + e.message
      raise "Unkown command Error"
    end
  end
end
