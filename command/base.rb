module Command
  class Base

    attr_reader :input, :application_state

    def initialize(input)
      @application_state ||= ApplicationState.instance
      @input = input
    end

    def execute
      raise ImplemenationRequired, "Sublclass should implement this"
    end

    def validate_arguments?
      raise ImplemenationRequired, "Sublclass should implement this"
    end

    def command_name
      "#{self.class.to_s.split('::').last}"
    end

    def all_stages
      (application_state.defined_stages + ['Hired', 'Rejected'])
    end

    def raise_invalid_input
      raise InvalidInput, "Invalid Input for #{command_name} command for input #{input}"
    end

    def stages_present?
      !application_state.defined_stages.empty?
    end

    def validate_stages
      raise InvalidStage, "Please DEFINE stages before #{command_name.upcase}" unless stages_present?
    end
  end
end
