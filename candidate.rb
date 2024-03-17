class Candidate
  attr_reader :email
  attr_accessor :stage

  def initialize(email, stage)
    @email = email
    @stage = stage
  end

  def advance_to(stage)
    @stage = stage
  end

  def hire!
    @stage = :hired
  end

  def reject!
    @stage = :rejected
  end
end
