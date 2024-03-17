require_relative 'base'
module Command
  class Stats < Base
    def initialize(input)
      super(input)
    end

    def execute
      calculate_stats

      application_state.stats.inject("") do |output, (k, v)|
        output  += "#{k} #{v} "
      end
    end

    def valid_arguments?
      #No validation required here
      true
    end

    private

    def calculate_stats
      stats = {}
      all_stages.each do |stage|
        stats[stage] = 0
      end

      application_state.candidates.each do |k, v|
        stats[v.stage.to_s.titleize] += 1
      end

      application_state.stats = stats
    end
  end
end
