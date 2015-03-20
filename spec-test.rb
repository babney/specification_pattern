Dir["#{File.dirname __FILE__}/**/*.rb"].each{|file| require file}
# a couple of mocks...
require 'ostruct'
guarantor1 = OpenStruct.new(name:"Steve")
guarantor2 = OpenStruct.new(name:"Dave")
guarantor3 = OpenStruct.new(name:"Joe")

loan_too_high = OpenStruct.new(amount: 1000000, guarantors: [guarantor1, guarantor2])
loan_too_low = OpenStruct.new(amount: 4500, guarantors: [guarantor1, guarantor2])
loan_just_right = OpenStruct.new(amount: 16000, guarantors: [guarantor1, guarantor2])
loan_too_few_guarantors = OpenStruct.new(amount: 16000, guarantors: [guarantor1])
loan_too_many_guarantors = OpenStruct.new(amount: 16000, guarantors: [guarantor1, guarantor2, guarantor3])

spec = Specification::FoobarBank.new

spec.is_satisfied_by? loan_just_right

spec2 = Specification::FuckDaveBank.new

spec2.is_satisfied_by? loan_just_right
