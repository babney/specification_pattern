module Specification
  class GuarantorName
    def initialize(name)
      @name = name
    end

    def is_satisfied_by?(loan)
      loan.guarantors.any?{|guarantor| guarantor.name == @name}
    end
  end
end
