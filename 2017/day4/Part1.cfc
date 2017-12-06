component {

	function run() {

		var test1 = "aa bb cc dd ee"; //valid
		var test2 = "aa bb cc dd aa"; //not valid
		var test3 = "aa bb cc dd aaa"; //valid

		print.line ("Test 1: #isValidPassphrase( test1 )#");
		print.line ("Test 2: #isValidPassphrase( test2 )#");
		print.line ("Test 3: #isValidPassphrase( test3 )#");

		var input = fileRead( "input.txt" );
		var lines = listToArray( input, chr(10) & chr(13) );
		var validCount = 0;
		for ( var line in lines ) {
			if ( isValidPassphrase( line ) ) {
				validCount++;
			}
		}
		print.line ("Answer: #validCount#");
	}

	function isValidPassphrase( string passphrase ) {

		return passphrase == listRemoveDuplicates( arguments.passphrase, " ");
	}
	
}