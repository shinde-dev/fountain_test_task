module Command
  class Create < Base

    attr_reader :candidate

    def initialize(input)
      super(input)
      @candidate = application_state.candidates[input.first]
    end

    def execute
      #Stages must be defined before create
      validate_stages
      return "Duplicate applicant" unless valid_arguments?

      #Get initial stage and assign to candidate
      initial_stage = application_state.defined_stages.first.underscore_to_sym
      candidate = Candidate.new(input.first, initial_stage)
      application_state.add_candidate(candidate)

      "#{command_name.upcase} #{candidate.email}"
    end

     def valid_arguments?
      candidate.nil?
    end
  end
end
