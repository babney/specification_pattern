module Specification
  class FuckDaveBank
    # this bank wants loans $15000 and over, and if any guarantors are
    # named Dave, they can go fuck themselves.

    def is_satisfied_by?(loan)
      # note: same method as FoobarBank, this can go in a superclass.
      specification.is_satisfied_by?(loan)
    end

    private

    def specification
      And.new([LoanAmountOver.new(14999.99), Not.new(GuarantorName.new("Dave"))])
    end
  end
end