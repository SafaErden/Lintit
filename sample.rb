def bubble_sort(arr)
  arr.each do
    i = 0
    while i < arr.length - 1
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1]
      i += 1
    end
  end
  arr
end

def bubble_sort_by(arr)
  arr.each do
    i = 0
    while i < arr.length - 1
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if yield(arr[i], arr[i + 1]). positive?
      i += 1
    end
  end
  arr
end

bubble_by = bubble_sort_by([4, 3, 78, 2, 0, 2, -2, -5]) do |x, y|
  x - y
end

bubble_by_test = bubble_sort_by(%w[hi hello hey]) { |left, right| left.length - right.length }

print bubble_sort(%w[orange tomato apple strawberry coconut])
puts
print bubble_by
puts
print bubble_by_test
