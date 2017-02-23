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