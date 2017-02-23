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

print fib(100) == 218922995834555169026 