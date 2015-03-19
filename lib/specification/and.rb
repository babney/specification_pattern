module Specification
  class And
    def initialize(specs)
      @specifications = specs
    end

    def is_satisfied_by?(subject)
      @specifications.all? do |spec|
        spec.is_satisfied_by?(subject)
      end
    end
  end
end
