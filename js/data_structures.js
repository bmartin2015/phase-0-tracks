var colors = ['blue', 'red', 'green', 'yellow'];
var names = ['Ed', 'Eddie', 'Mr. Ed', 'Edd'];

colors.push('purple');
names.push('Ted');

console.log(colors);
console.log(names);

var horses = {};

for(i = 0; i < names.length; i++) {
    horses[names[i]] = colors[i];
};

console.log(horses);

function Car(make, model, year, color) {
    console.log('A new car:', this);
    this.make = make;
    this.model = model;
    this.year = year;
    this.color = color;

    this.revEngine = function() {console.log('VROOM VROOM');};
    console.log('Enjoy your new car!');
}

var newCar = new Car('Chevy', 'Malibu', 2016, 'red');
console.log(newCar);
newCar.revEngine();

// var newerCar = new Car('Chevy', 'Malibu', 2017, 'yellow');
// console.log(newerCar);
// newerCar.revEngine();

// var newestCar = new Car('Tesla', 'Flying Car', 2020, 'black');
// console.log(newestCar);
// newestCar.revEngine();

for(var key in newCar) {
    console.log(key + ': ' + newCar[key]);
};