require 'bundler'
require 'ostruct'
Bundler.require

Dir["#{File.dirname __FILE__}/lib/specification/*.rb"].each{|file| require file}

RSpec.describe "bank specifications" do
  let(:guarantor1){OpenStruct.new(name:"Steve")}
  let(:guarantor2){OpenStruct.new(name:"Dave")}
  let(:guarantor3){OpenStruct.new(name:"Joe")}

  let(:loan_too_high){OpenStruct.new(amount: 1000000, guarantors: [guarantor1, guarantor2])}
  let(:loan_too_low){OpenStruct.new(amount: 4500, guarantors: [guarantor1, guarantor2])}
  let(:loan_just_right){OpenStruct.new(amount: 16000, guarantors: [guarantor1, guarantor2])}
  let(:loan_too_few_guarantors){OpenStruct.new(amount: 16000, guarantors: [guarantor1])}
  let(:loan_too_many_guarantors){OpenStruct.new(amount: 16000, guarantors: [guarantor1, guarantor2, guarantor3])}

  context "FooBar Bank" do
    let(:bank_spec){Specification::FoobarBank.new}
    context "The just right loan" do
      subject{bank_spec.is_satisfied_by? loan_just_right}
      it{is_expected.to eq true}
    end

    context "the too low loan" do
      subject{bank_spec.is_satisfied_by? loan_too_low}
      it{is_expected.to eq false}
    end

    context "the too high loan" do
      subject{bank_spec.is_satisfied_by? loan_too_high}
      it{is_expected.to eq false}
    end

    context "the loan with too few guarantors" do
      subject{bank_spec.is_satisfied_by? loan_too_few_guarantors}
      it{is_expected.to eq false}
    end

    context "the loan with too many guarantors" do
      subject{bank_spec.is_satisfied_by? loan_too_many_guarantors}
      it{is_expected.to eq false}
    end
  end

  context "We Hate Dave Bank" do
    let(:bank_spec){Specification::WeHateDaveBank.new}

    context "The just right loan (which includes a Dave)" do
      subject{bank_spec.is_satisfied_by? loan_just_right}
      it{is_expected.to eq false}
    end

    context "the loan with only one guarantor (who is not Dave)" do
      subject{bank_spec.is_satisfied_by? loan_too_few_guarantors}
      it{is_expected.to eq true}
    end
  end

  context "We Love Dave Bank" do
    let(:loan_without_dave){OpenStruct.new(amount: 100000, guarantors: [guarantor1, guarantor3])}
    let(:loan_with_dave){OpenStruct.new(amount: 100000, guarantors: [guarantor1, guarantor2])}
    let(:bank_spec){Specification::WeLoveDaveBank.new}

    context "the large loan with no Dave" do
      subject{bank_spec.is_satisfied_by? loan_without_dave}
      it{is_expected.to eq false}
    end

    context "the large loan with a Dave" do
      subject{bank_spec.is_satisfied_by? loan_with_dave}
      it{is_expected.to eq true}
    end
  end
end
