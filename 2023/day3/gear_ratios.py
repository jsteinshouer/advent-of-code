# https://adventofcode.com/2023/day/3

import os, re

f = open(os.path.dirname(os.path.realpath(__file__)) + "/input.txt", "r")
lines = f.readlines()

# lines = [
#     "467..114..",
#     "...*......",
#     "..35..633.",
#     "......#...",
#     "617*......",
#     ".....+.58.",
#     "..592.....",
#     "......755.",
#     "...$.*....",
#     ".664.598.."
# ]

line_index = 0
part_numbers = [];
pattern = re.compile("[^0-9\.\n]")
for line in lines:
    # print(re.findall(r"\d+", line))
    matches_iter = re.finditer(r"\d+", line)
    for match in matches_iter:
        start = 0 if match.start() == 0 else match.start() - 1 
        end = match.end() + 1 if len(line) >= match.end() else match.end()
        # print(match.group())
        is_part_num = False
        if match.start() > 0 and line[match.start() - 1] != ".":
            if not is_part_num:
                part_numbers.append( int(match.group()) )
                is_part_num = True
        if line[match.end()].strip() not in [".",""]:
            if not is_part_num:
                part_numbers.append( int(match.group()) )
                is_part_num = True
        if line_index > 0:
            prev_line = lines[line_index - 1][start:end]
            # print(prev_line)
            if pattern.search(prev_line) and not is_part_num: 
                part_numbers.append( int(match.group()) )
                is_part_num = True
        if line_index + 1 < len(lines):
            next_line = lines[line_index + 1][start:end]
            # print(next_line)
            if pattern.search(next_line) and not is_part_num:
                part_numbers.append( int(match.group()) )
                is_part_num = True

    line_index = line_index + 1

print( sum(part_numbers) )