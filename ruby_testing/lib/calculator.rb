class Calculator
  def add(*args)
    args.sum
  end

  def multiply(num1, num2, *args)
    product = num1*num2
    args.each { |num| product *= num }
    product
  end
end