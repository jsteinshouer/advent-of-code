f = open("input.txt", "r")
lines = f.readlines()

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

print(total)