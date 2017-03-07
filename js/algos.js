// In algos.js, write a function that takes an array of words or phrases and returns the longest word or phrase in the array. So if we gave your function the array of ["long phrase","longest phrase","longer phrase"], it would return "longest phrase". This is a logical reasoning challenge, so try to reason through this based on what you already know, rather than Googling the fanciest solution or looking up built-in sorting functions. Note that "some string".length will do what you expect in JS.
// Add driver code that tests your function on a few arrays.

// Function that takes an array of words or phrases and returns the longest word or phrase in the array.
// Input: Array of strings
// Steps:
	// FOR each item in Array
		// compare length of stored index to current index
		// IF length of current index is larger than next index
			// store index
	// RETURN the stored index of the array as string
// Output: string
function longestString(arr) {
	var stored_index = 0; // Set default index
	for(i = 0; i < arr.length; i++) {
		if(arr[stored_index].length <= arr[i].length) {
			stored_index = i;
		}
	}
	return arr[stored_index];
}

// TEST CODE
var str = "";
var arr = ["long phrase","longest phrase","longer phrase"];
console.log(longestString(arr));

var test = ["123456790","12345","2538","1234578"];
console.log(longestString(test));

var test2 = ["12345", "123456", "12345678", "111111111111111111111"];
console.log(longestString(test2))