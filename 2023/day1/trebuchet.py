# https://adventofcode.com/2023/day/1

import os, re

f = open(os.path.dirname(os.path.realpath(__file__)) + "/input.txt", "r")
lines = f.readlines()

def calibration():
    total = 0;
    for line in lines:
        digits = [];
        for char in list(line):
            if char.isdigit():
                if len(digits) == 0:
                    digits.append(char);
                    digits.append(char);
                else:
                    digits[1] = char;
        total = total + int(digits[0] + digits[1])
    return total

print(calibration())

def calibration2():
    numbers = ["one","two","three","four","five","six","seven","eight","nine"]
    pattern = "(one|two|three|four|five|six|seven|eight|nine|1|2|3|4|5|6|7|8|9)"
    debug = False
    total = 0;

    for line in lines:
        matches = []
        for i in range(len(list(line))):
            match = re.match(pattern,line[i:])
            if match:
                try:
                    matches.append( str(numbers.index(match.group()) + 1))
                except:
                    matches.append( str(match.group() ) )

        total = total + int(matches[0] + matches[len(matches) - 1])
    return total

print(calibration2())