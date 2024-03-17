require_relative 'base'
module Command
  class Decide < Base
    attr_reader :candidate, :action

    def initialize(input)
      super(input)
      @candidate = application_state.candidates[input.first]
      @action = input[1].to_i
    end

    def execute
      validate_stages
      raise_invalid_input unless valid_arguments?

      if action == 1
        #validate that candidate should be last stage before hiring
        return "Failed to decide for #{candidate.email}" unless (candidate.stage.to_s.titleize == application_state.defined_stages.last)

        candidate.hire!
        return "Hired #{candidate.email}"
      elsif action == 0
        candidate.reject!
        return "Rejected #{candidate.email}"
      end
    end

    def valid_arguments?
      # candidate and action should be present with valid action i.e. 1 or 0
      !candidate.nil? && !action.nil? && [0,1].include?(action)
    end
  end
end
