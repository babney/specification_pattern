module Specification
  class FoobarBank
    # for the purposes of the exercise, this bank requires that a loan be
    # no more than $500,000 and no less than $5,000. In addition, the loan must
    # have exactly two guarantors.

    # I recognize the LoanAmountOver and LoanAmountUnder might be better
    # composed of GreaterThan or EqualTo specs. This is all just fast and loose.

    # def initialize
    #   #nothing to do here!
    # end

    def is_satisfied_by?(loan)
      specification.is_satisfied_by?(loan)
    end

    private

    def specification
      And.new([LoanAmountOver.new(4999.99), LoanAmountUnder.new(500000.01), GuarantorCount.new(2)])
    end
  end
end
