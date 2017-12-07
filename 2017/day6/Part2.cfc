component {

	function run() {

		// var banks = [0,2,7,0];
		var banks = [4,1,15,12,0,9,9,5,5,8,7,3,14,5,12,3];
		var configurations = [];
		var duplicateFound = false;

		while ( !duplicateFound ) {
			redistribute( banks );
			var config = banks.toList("");
			duplicateFound = configurations.contains( config );
			configurations.append( config );
		}

		var duplicate = config;
		var matches = [];
		var additionalCycles = 0;

		while ( matches.len() < 3 ) {
			redistribute( banks );
			additionalCycles++;
			// print.text( serializeJSON(banks) );
			matches = configurations.findAll( duplicate );
			configurations.append( banks.toList("") );
		}

		print.greenLine("Answer: " & additionalCycles - 1);
	}

	function redistribute( banks ) {

		var index = banks.find( banks.max() );
		var blocks = banks[index];

		banks[index] = 0;
		while ( blocks > 0 ) {
			index = index == banks.len() ? 1 : index + 1;
			banks[index] = banks[index] + 1;
			blocks = blocks - 1;
		}
	}

}