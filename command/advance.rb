#require_relative 'base'
module Command
  class Advance < Base

    attr_reader :candidate, :input_stage

    def initialize(input)
      super(input)
      @candidate = application_state.candidates[input.first]
      @input_stage = @input[1]
    end

    def execute
      validate_stages
      raise_invalid_input unless valid_arguments?

      if input_stage
        return "Already in #{input_stage}"  if (input_stage == candidate.stage.to_s.titleize)
        next_stage = input_stage
      else
        # Get next stage from application_state.defined_stages
        current_stage_index = application_state.defined_stages.index(candidate.stage.to_s.titleize)
        next_stage = application_state.defined_stages[current_stage_index + 1]
      end

      # Advance to next stage
      candidate.advance_to(next_stage.underscore_to_sym)
      "#{command_name.upcase} #{candidate.email}"
    end



    private
    def valid_arguments?
      #candidate should be present and Stage should be valid 
      return !candidate.nil? && all_stages.include?(input_stage) if input_stage

      !candidate.nil?
    end
  end
end
