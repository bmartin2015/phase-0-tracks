train = {
	"Sleeper Car One": {
		car_name: "Constantinople - Calais",
		first_class_berths: 8,
		second_class_berths: 4,
		first_class_passengers: ["Poirot","Ratchett","Hubbard","H Andrenyi", "R. Andrenyi", "Dragomiroff", "Arbthnot", "Hardman"],
		second_class_passengers: ["Masterman", "Foscarelli", "Schmidt", "MacQueen", "Ohisson", "Debenham"]
		},
	"Sleeper Car Two": {
		car_name: "Athens - Paris",
		first_class_berths: 8,
		second_class_berths: 4,
		first_class_passengers: ["Constantine", "Bouc"],
		second_class_passengers: []
		},
	"Dining Car": {
			beverages: ["perrier", "hot coffee", "orange juice", "liqueur", "cup of tea", "cognac"],
			meals: ["eggs (including omelet)", "soup", "delicate cream cheese", "chicken (without sauces)", "boiled fish", "cereal", "biscuits"]
		},
	"Coach One": ["Not accessible"]
}

puts train[:"Sleeper Car One"][:car_name]
puts train[:"Sleeper Car One"][:second_class_berths]
puts train[:"Sleeper Car Two"][:first_class_passengers][1]
puts train[:"Dining Car"][:meals]
puts train[:"Coach One"]