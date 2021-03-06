// RELEASE 0
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
		// I recall from my University JS class that you can address strings like arrays
		if(arr[stored_index].length <= arr[i].length) {
			stored_index = i;
		};
	};
	return arr[stored_index];
};

// RELEASE 1
// Function that takes two objects and checks if they share at least one key-value pair
// Input: two objects
// Steps:
	// FOR each key in object 1
		// IF current key-value is equal to any key-value in object 2
			// set match = TRUE
		// ELSE
			// match = FALSE
	// RETURN match
// Output: bool
function twoObjects(obj1, obj2) {
	var match = false;
	for (var key in obj1) {
		if (obj1[key] == obj2[key]) {
			match = true;
		} else {
			match = false
		};
	};
	return match;
};

//RELEASE 2
// Function that takes an integer and returns an array of strings of the given length
// Input: integer
// Steps:
	// loop the number of times for the given integer
		// Generate a random number for length of word
		// loop the number of letters
			// Generate a random letter and add to word
		// add word to array
		// return array
// Output: array
function randomWords(numberWords) {
	var wordList = [];
	var alphabet = "abcdefghijklmnopqrstuvwyz"
	for(i = 1; i <= numberWords; i++) {
		var word = "";
		var rand = Math.floor(Math.random() * 10) + 1;
		for (x = 0; x < rand; x++ ) {
			word += alphabet[Math.floor(Math.random() * alphabet.length)];
		}
		wordList.push(word);
	}
	return wordList;
}



// TEST CODE - RELEASE 0
// var str = "";
// var arr = ["long phrase","longest phrase","longer phrase"];
// console.log(longestString(arr));

// var test = ["123456790","12345","2538","1234578"];
// console.log(longestString(test));

// var test2 = ["12345", "123456", "12345678", "111111111111111111111"];
// console.log(longestString(test2))


// TEST CODE - RELEASE 1
// var obj1 = {name: "Steven", age: 54};
// var obj2 = {name: "Tamir", age:54};

// console.log(twoObjects(obj1, obj2));

// var newObj1 = {name: "Steven", age: 22};
// var newObj2 = {name: "Allen", age: 38, height: "5'6"}

// console.log(twoObjects(newObj1, newObj2));

// TEST CODE - RELEASE 2
for (test = 1; test <= 10; test ++) {
	var numWords = Math.floor(Math.random() * 10) + 1;
	var wordList = randomWords(numWords);
	console.log("Word List " + test + ": " + wordList);
	console.log("Test " + test + ": " + longestString(wordList));
}