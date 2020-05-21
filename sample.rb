
def bubble_sort(arr)

  arr.each do
    i = 0

  while i<arr.length-1
    arr[i], arr[i + 1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1]
      i += 1

  end
  end
  arr

end

def bubble_sort_by (arr)
a= { a:"a" }
  arr.each do
    i = 0
    while i <=arr.length - 1
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if yield(arr[i], arr[i + 1]). positive?
      i += 1
      end
    end
  arr
end

def sortit

  def another_def
  end
end

  bubble_by = bubble_sort_by
    x-y
  arr=[]
 arr.map!

end

bubble_by_test = bubble_sort_by(%w[hi hello hey]) { |left, right| left.length - right.length }

print bubble_sort(%w[orange tomato apple strawberry coconut])
  puts
print bubble_by
  puts
print bubble_by_test

class TestCase
end

module Csed
end

