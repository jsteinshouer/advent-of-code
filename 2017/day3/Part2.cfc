component  {
    function run() {

        var input = 361527;
        
        print.greenLine( "Answer: " & getAnswer( input ) );
 
    }

    function getAnswer( input ) {

        var c = [0,0];
        var grid = {"0" = {"0" = 1}};
        var compass = ["E","N","W","S"];
        var turns = 0;
        var steps = 0;
        var stepsBeforeTurn = 1;
        var direction = 1;
        var nextValue = 0;

        while (nextValue <= input) {

            steps = steps + 1;   
            
            /* Change coordinates for each step */
            switch(compass[direction]) {
                case "N":
                    c[1] = c[1] + 1;
                break;
                case "E":
                    c[2] = c[2] + 1;
                break;
                case "W":
                    c[2] = c[2] - 1;
                break;
                case "S":
                    c[1] = c[1] - 1;
                break;
            };

            /* Add the next value to the grid */
            nextValue = getNextValue( c, grid );
            grid[c[1]][c[2]] = nextValue;
            
            /* Do we need to turn? */
            if (steps == stepsBeforeTurn) {
                steps = 0;
                turns = turns + 1;
                direction = direction + 1;
                if (direction > 4){ direction = 1};
            }

            /* It is a spiral so we need to add another step forward every 2 turns */
            if (turns == 2) {
                stepsBeforeTurn = stepsBeforeTurn + 1;
                turns = 0;
            }
            
        }

        return nextValue;
 
    }

    function getNextValue( c, grid ) {

         var nextValue = 0;

        // Add Neighbors togehter to get next value
        if ( checkCoordinates( [ c[1] + 1, c[2] ], grid ) ) { nextValue = nextValue + grid[c[1] + 1][c[2]]};
        if ( checkCoordinates( [ c[1] - 1, c[2] ], grid ) ) { nextValue = nextValue + grid[c[1] - 1][c[2]]};
        if ( checkCoordinates( [ c[1] + 1, c[2] + 1 ], grid ) ) { nextValue = nextValue + grid[c[1] + 1][c[2] + 1]};
        if ( checkCoordinates( [ c[1] - 1, c[2] - 1 ], grid ) ) { nextValue = nextValue + grid[c[1] - 1][c[2] - 1]};
        if ( checkCoordinates( [ c[1] + 1, c[2] - 1 ], grid ) ) { nextValue = nextValue + grid[c[1] + 1][c[2] - 1]};
        if ( checkCoordinates( [ c[1] - 1, c[2] + 1 ], grid ) ) { nextValue = nextValue + grid[c[1] - 1][c[2] + 1]};
        if ( checkCoordinates( [ c[1], c[2] + 1 ], grid ) ) { nextValue = nextValue + grid[c[1]][c[2] + 1]};
        if ( checkCoordinates( [ c[1], c[2] - 1 ], grid ) ) { nextValue = nextValue + grid[c[1]][c[2] - 1]};

        return nextValue;
    }

    function checkCoordinates( coordinates, grid ) {

       return structkeyExists( grid, coordinates[1] ) && structkeyExists( grid[coordinates[1]], coordinates[2]);
    }

}