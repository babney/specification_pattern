module Specification
  class LoanAmountOver
    def initialize(amount)
      @amount = amount
    end

    def is_satisfied_by?(loan)
      loan.amount > @amount
    end
  end
end
