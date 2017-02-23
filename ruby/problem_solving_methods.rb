# Release 0
arr = [5,34,256]

def search_array(arr, serach_number)
	count = 0
	index_output = nil
	arr.each { |numb|
		if serach_number == numb
			index_output = count
		end
		count += 1
	}
	return index_output
end

p search_array(arr, 100)

# Release 1
# 2: [0,1] 
# 3: [0,1,1] = 0 + 1
# 6: [0,1,1,2,3,5] = 2 + 3
# 7: [0,1,1,2,3,5,8] = 3 + 5

def fib(number)
	fib_list = [0,1]
	until fib_list.length == number
		fib_list << fib_list[-1] + fib_list[-2]
	end
	return fib_list[-1]
end

p fib(100)
p fib(100) == 218922995834555169026

# Release 3

# PSEUDOCODE
# Start with unsorted array (start_array)
# Loop until start_array is sorted (least to greatest)
# (We want to run until the number of not swapped = array length -1)
#   Loop until counter = length 
# 		take pair of indexes (x,y) and compare them
#   	if x > y - swap x and y
# 	    add one to the counter

start_array = [8, 25, 4, 7]

def bubble_sort(start_array)
	swapped = 0
	until swapped == start_array.length - 1
		count = 0
		swapped = 0
		until count == start_array.length - 1
			if start_array[count] > start_array[count+1]
				higher = start_array[count]
				lower = start_array[count+1]
				start_array[count] = lower
				start_array[count+1] = higher
			else
				swapped += 1
			end
			count += 1
		end
	end
	return start_array
end

p bubble_sort(start_array)