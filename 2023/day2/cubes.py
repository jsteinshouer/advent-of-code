# https://adventofcode.com/2023/day/2

import os, re

f = open(os.path.dirname(os.path.realpath(__file__)) + "/input.txt", "r")
lines = f.readlines()

bag = {
    "red": 12,
    "green": 13,
    "blue": 14
}

def sum_games_possible():
    total = 0
    game_index = 0
    for line in lines:
        game_index = game_index + 1
        game = line.split(":")
        reveals = game[1].strip().split(";")
        is_possible = True
        for reveal in reveals:
            cube_colors = reveal.split(",")
            for color in cube_colors:
                item = color.strip().split(" ")
                if int(item[0]) > bag[item[1]]:
                    is_possible = False
                    break
            if not is_possible:
                break
        if is_possible:
            total = total + game_index
        # print(total)

    return total

print(sum_games_possible())
