require './lib/calculator'

describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2,5,7)).to eql(14)
    end
  end

  describe "#multiply" do
    it "returns the product of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(6, 9, 77)).to eql(4158)
    end
  end
end