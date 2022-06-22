def merge_sort(arr)
  if arr.length > 1
    left, right = arr[0...((arr.length)/2).ceil], arr[((arr.length)/2).ceil...arr.length]
    # p left
    # p right
    merge_sort(left)
    merge_sort(right)
    merge(left, right, arr)
  end
  return arr
end

def merge(_B, _C, _A)
  b, c, a = 0, 0, 0

  p = _B.length
  q = _C.length

  while b < p && c < q do
    if _B[b] < _C[c]
      _A[a] = _B[b]
      b = b + 1
    else
      _A[a] = _C[c]
      c = c + 1
    end
    a = a + 1
  end
  if b == p + 1
    _A[_A.length-1..(p+q)] = _C[c..q]
  else
    _A[_A.length-1..(p+q)] = _B[b..p]
  end
  return _A
end