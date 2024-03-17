$LOAD_PATH << File.dirname(__FILE__)

require 'utility/ruby_string_methods'
require 'io/reader'
require 'io/writer'
require 'command_parser'
require 'application_state'
require 'error'

# load commands
require 'command/define'
require 'command/stats'
require 'command/create'
require 'command/advance'
require 'command/decide'

require 'candidate'

class HireProcessor
  class << self
    def run
      @input_reader = Io::Reader.new('data/input.txt')
      @output_writer = Io::Writer.new('data/output.txt')

      while (next_line = @input_reader.next_line) do
        command = CommandParser.parse(next_line)
        output = command.execute
        @output_writer.write_line(output)
      end
    ensure
      close_io_stream
    end

    private
    def close_io_stream
      @input_reader.close
      @output_writer.close
    end
  end
end

HireProcessor.run
