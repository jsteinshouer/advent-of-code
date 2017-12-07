component {

	function run() {

		// var input = fileRead( "test_input.txt" );
		var input = fileRead( "input.txt" );
		var instructions = listToArray( input, chr(10) & chr(13) );
		var position = 1;
		var steps = 0;

		var validCount = 0;
		while ( position <= instructions.len() ) {
			var newPosition = jump( instructions, position );
			steps++;
			position = newPosition;
		}
		print.line ("Answer: #steps#");
	}

	function jump( instructions, position ) {
		/* Get the offset */
		var newPosition = position + instructions[ position ];

		if ( instructions[ position ] > 2 ) {
			instructions[ position ] = instructions[ position ] - 1;
		}
		else {
			instructions[ position ] = instructions[ position ] + 1;	
		}

		return newPosition;
	}

	
}