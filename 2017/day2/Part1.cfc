component  {
    function   run() {

        var input = fileRead( "input.txt" );
        var input = listToArray( input, chr(10) & chr(13) );

        print.greenLine( "Answer: " & getAnswer(  input ) ) ;
 
    }

    function getAnswer( input ) {

       return input.reduce( function( result, row ) {

           return result + getRowDifference(  listToArray( row, chr(9) ) );

       }, 0);
 
    }

    function getRowDifference( row ) {
        return row.max() - row.min(); 
    }

}