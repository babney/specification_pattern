# module Specification
#   class WeLoveDaveBank
#     # this bank wants loans between $15000 and $50000, BUT if any guarantors are
#     # named Dave, they can get a loan for up to $100000.

#     def is_satisfied_by?(loan)
#       # note: same method as FoobarBank, this can go in a superclass.
#       specification.is_satisfied_by?(loan)
#     end

#     private

#     def specification
#       Or.new([LoanAmountOver.new(14999.99), GuarantorName.new("Dave")])
#     end
#   end
# end
