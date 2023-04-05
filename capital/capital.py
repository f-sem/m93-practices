
def capital_space(inputstring):
    new_string = ""
    for i in range(len(inputstring)):
        if inputstring[i].isupper():
            new_string += " " + inputstring[i]
        else:
            new_string += inputstring[i]

    print(new_string)

capital_space("Maktab")
capital_space("TheFirstProgrammingBootcamp")
