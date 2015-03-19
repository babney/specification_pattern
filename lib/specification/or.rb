module Specification
  class Or
    def initialize(specs)
      @specifications = specs
    end

    def is_satisfied_by?(subject)
      @specifications.any? do |spec|
        spec.is_satisfied_by?(subject)
      end
    end
  end
end
