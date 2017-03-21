console.log("The script is working!");

function addBrownBorder(event) {
	event.target.style.border = "2px solid brown";
}

var description = document.getElementById("description")
description.insertAdjacentHTML('afterbegin', '<p>He is an escape artist</p>')

var dog = document.getElementById("Spot");
dog.addEventListener("click", addBrownBorder);

function addSentence(event) {
	event.target.insertAdjacentHTML('beforebegin', '<p>Spot likes to catch squirrels.</p>')
}

dog.addEventListener("click", addSentence);
