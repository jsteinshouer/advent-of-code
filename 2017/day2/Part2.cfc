component  {
    function   run() {

        var input = fileRead( "input.txt" );
        var input = listToArray( input, chr(10) & chr(13) );

        print.greenLine( "Answer: " & getAnswer( input ) );
 
    }


    function   getAnswer( input ) {

        return input.reduce( function( result, row ) {

           return result + getRowResult( listToArray( row, chr(9) ) );

       }, 0);
 
    }

    function getRowResult( row ) {
       
       for (index = 1; index <= row.len(); index++) {

           var num = row[index];

           for (i = 1; i <= row.len(); i++) {
                
                if (i != index && num % row[i] == 0) {
                    return num / row[i];
                }
            }

       }
       
    }
}