import re


def readFile():
    source_file = open("input.txt", "r")
    file_lines = source_file.readlines()
    running_sum = 0
    for line in file_lines:
        pattern = r"\s"
        line = re.sub(pattern, "", line)
        game_details = line.strip().split(":")[1].strip().split(";")
        running_sum += getMinNumberOfMarbles(game_details)
    return running_sum


def getMinNumberOfMarbles(game_details):
    marbleCounter = {"red": 0, "blue": 0, "green": 0}
    for detail in game_details:
        marble_details = detail.split(",")
        for marble_detail in marble_details:
            indexOfLetter = findIndexOfFirstCharacter(marble_detail)
            marble_count = marble_detail[0:indexOfLetter]
            marble_colour = marble_detail[indexOfLetter:]
            marbleCounter[marble_colour] = max(
                marbleCounter[marble_colour], int(marble_count)
            )
    return marbleCounter["red"] * marbleCounter["blue"] * marbleCounter["green"]


def findIndexOfFirstCharacter(string):
    for i in range(len(string)):
        if string[i].isalpha():
            return i
    return -1


if __name__ == "__main__":
    result = readFile()
    print(result)
