# Returns a new array to that contains elements in the intersection of the two input arrays
# Time complexity: O(m^2) + O(n log m), where n is the length of the shorter array, and m is the length of the longer array
# Space complexity: Linear or O(n) if n < m  (where n is the length of the shorter array, and m is the length of the longer array)
def intersection(array1, array2)
  return [] if array1 == nil || array2 == nil

  # Figure out which array is longer (so longest will be sorted)
  # (If they're the same, array1 will be sorted)
  if array1.length > array2.length || array1.length == array2.length
    longer_sorted_array = array1
    shorter_array = array2
  else
    longer_sorted_array = array2
    shorter_array = array1
  end

  # Sort larger array
  i = 1
  while i < longer_sorted_array.length
    to_insert = longer_sorted_array[i]
    j = i

    # searching for correct position to insert longer_sorted_array[j]
    while j > 0 && longer_sorted_array[j - 1] > to_insert
      longer_sorted_array[j] = longer_sorted_array[j - 1]
      j -= 1
    end

    longer_sorted_array[j] = to_insert
    i += 1
  end

  # For each element in smaller array, perform binary search in sorted array
  results = []

  shorter_array.each do |num|
    low = 0
    high = longer_sorted_array.length - 1

    while low < high
      mid = (low + high) / 2
      if longer_sorted_array[mid] == num
        results << num
        break
      elsif longer_sorted_array[mid] > num
        high = mid - 1
      elsif longer_sorted_array[mid] < num
        low = mid + 1
      end

      if longer_sorted_array[low] == num
        results << num
        break
      end
    end
  end

  return results
end
