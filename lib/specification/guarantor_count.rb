module Specification
  class GuarantorCount
    def initialize(count)
      @count = count
    end

    def is_satisfied_by?(loan)
      loan.guarantors.count == @count
    end
  end
end
