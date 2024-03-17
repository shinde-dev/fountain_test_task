require_relative 'base'
require 'pry'
module Command
  class Define < Base

    AVAILABLE_STAGES = %w(ManualReview PhoneInterview BackgroundCheck DocumentSigning)

    def initialize(input)
      super(input)
    end

    def execute
      raise_invalid_input unless valid_arguments?
      application_state.defined_stages.concat(input)
      "#{command_name.upcase} #{input.join(' ')}"
    end

    def valid_arguments?
      (AVAILABLE_STAGES & input).any?
    end
  end
end
