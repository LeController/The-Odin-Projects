def fibs(num)
  arr = []
  if num == 0
    return arr
  elsif num == 1
    return arr.push(0)
  else
    arr.push(0,1)
  end
  num -= 2

  while num > 0 do
    next_num = arr[-2] + arr[-1]
    arr.push(next_num)
    num -= 1
  end

  return arr
end

def fibs_rec(num, arr = [])
  return [] if num == 0
  return [0] if num == 1 
  return [0,1] if num == 2

  arr = (fibs_rec(num-1))
  arr.push(arr[-2] + arr[-1])
  return arr
end

p fibs_rec(5)