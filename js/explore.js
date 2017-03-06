// Function that takes a string and reverses it
// input: STRING
// steps:
//	FOR EACH letter in STRING counting down
//	  take letter and add to output string
// output: string
function reverse(input_string) {
	var output_string = '';
	for(i = input_string.length-1; i >= 0; i--) {
		output_string += input_string[i];
	}
	return output_string
}

// TEST CODE
console.log(reverse("Hello"));