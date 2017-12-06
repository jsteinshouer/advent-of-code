component  {
    function   run() {

        var input = 361527;

        print.greenLine( "Answer: " & getSteps( input ) );
 
    }

    function getSteps( input ) {

        var c = [0,0];
        var compass = ["E","N","W","S"];
        var turns = 0;
        var steps = 0;
        var stepsBeforeTurn = 1;
        var direction = 1;

        for (i = 1; i <= input - 1; i++) {

            steps = steps + 1;   
            
            /* Which direction are we going? */
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

            /* Do we need to turn? */
            if (steps == stepsBeforeTurn) {
                steps = 0;
                turns = turns + 1;
                direction = direction + 1;
                if (direction > 4){ direction = 1};
            }

            /* When we turn twice we need to take another step before turning */
            if (turns == 2) {
                stepsBeforeTurn = stepsBeforeTurn + 1;
                turns = 0;
            }
            
        }

        /* add coordinates together to get the steps */
        return ( abs(c[1]) + abs(c[2]) );
 
    }

}