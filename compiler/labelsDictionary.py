# instructionElementsList => string list list
def getLabelDictionary(instructionElementsList):
    
    labelDictionary = {}

    # variable to know the number of the current line
    pointerLine = 0

    for instruction in instructionElementsList:

        pointerLine += 1

        instructionLength = len(instruction)

        # label
        if(instructionLength == 1):

            labelDictionary[instruction[0]] = pointerLine

            instructionElementsList.remove(instruction)

    return labelDictionary, instructionElementsList