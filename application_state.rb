require 'singleton'
#Singleton Pattern class to maintain application state between commands
class ApplicationState
  include Singleton

  attr_accessor :defined_stages, :candidates, :stats

  def initialize
    @candidates = {}
    @defined_stages = []
    @stats = {}
  end

  def add_candidate(candidate)
    candidates.merge!({candidate.email => candidate})
  end
end
