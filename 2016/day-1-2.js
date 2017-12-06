//https://jsbin.com/tuwugecuze/edit?js,console

var compass = ["N","E","S","W"];
var i = 0;
var coordinates = [0,0];
var directions = ["L4","R2","R4","L5","L3","L1","R4","R5","R1","R3","L3","L2","L2","R5","R1","L1","L2","R2","R2","L5","R5","R5","L2","R1","R2","L2","L4","L1","R5","R2","R1","R1","L2","L3","R2","L5","L186","L5","L3","R3","L5","R4","R2","L5","R1","R4","L1","L3","R3","R1","L1","R4","R2","L1","L4","R5","L1","R50","L4","R3","R78","R4","R2","L4","R3","L4","R4","L1","R5","L4","R1","L2","R3","L2","R5","R5","L4","L1","L2","R185","L5","R2","R1","L3","R4","L5","R2","R4","L3","R4","L2","L5","R1","R2","L2","L1","L2","R2","L2","R1","L5","L3","L4","L3","L4","L2","L5","L5","R2","L3","L4","R4","R4","R5","L4","L2","R4","L5","R3","R1","L1","R3","L2","R2","R1","R5","L4","R5","L3","R2","R3","R1","R4","L4","R1","R3","L5","L1","L3","R2","R1","R4","L4","R3","L3","R3","R2","L3","L3","R4","L2","R4","L3","L4","R5","R1","L1","R5","R3","R1","R3","R4","L1","R4","R3","R1","L5","L5","L4","R4","R3","L2","R1","R5","L3","R4","R5","L4","L5","R2"];
var log = [];
var found = false
var answers = [];

directions.forEach(function(item) {
	var turn = item.slice(0,1);
	var totalBlocks = parseInt(item.slice(1),10);

	if (turn == "R") {
		i = i + 1;
	}
	else {
		i = i - 1;
	}

	if (i > 3) i = 0;
	if (i < 0) i = 3;

	var blocks = 0;
	while (blocks < totalBlocks) {
		blocks = blocks + 1;
		switch(compass[i]) {
			case "N":
				coordinates[0] = coordinates[0] + 1;
			break;
			case "E":
				coordinates[1] = coordinates[1] + 1;
			break;
			case "W":
				coordinates[1] = coordinates[1] - 1;
			break;
			case "S":
				coordinates[0] = coordinates[0] - 1;
			break;
		};
		if (log.indexOf(coordinates.join(":")) > -1 && !answers[1]) {
			answers[1] = coordinates[0] + coordinates[1];
		}
		log.push(coordinates.join(":"));
	}

});

answers[0] = coordinates[0] + coordinates[1];

console.log(answers);
