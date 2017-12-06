component {

	function run() {

		var test1 = "abcde fghij"; //valid
		var test2 = "abcde xyz ecdab"; //not valid
		var test3 = "a ab abc abd abf abj"; //valid

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

		return hasDuplicates( sortWords( passphrase ) );
	}

	function hasDuplicates( string passphrase ) {

		return passphrase == listRemoveDuplicates( arguments.passphrase, " ");
	}

	private function sortWords( string passphrase ) {
		
		var sortedWords = listToArray( arguments.passphrase, " ").map( function(item) {
			return sortString( item );
		});
		
		return sortedWords.toList(" ");
	}
	

	private function sortString( string word ) {
		
		return listSort( lcase( arguments.word ), "text", "asc", "" );
	}
	
}