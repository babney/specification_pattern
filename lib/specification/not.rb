module Specification
  class Not
    def initialize(spec)
      @specification = spec
    end

    def is_satisfied_by?(subject)
      !@specification.is_satisfied_by?(subject)
    end
  end
end
