# instr type dictionary 
typeDictionary = {
    "cargar": "00",
    "guardar": "00",
    "cargarv": "00",
    "guardarv": "00",

    "suma": "01",
    "mult": "01",   
    "sumita": "01",
    "cad": "01",
    "cld": "01",
    "cli": "01",
    "unioncita": "01",

    "igual": "10",
    "brinco": "10",

    "sumvec": "11",
    "multvec": "11",
    "univec": "11",

    "cadvec": "11",
    "cldvec": "11",
    "clivec": "11",
    "univecita": "11",
}

# opcode dictionary definition
opcodeDictionary = {
    "cargar": "00",
    "guardar": "01",
    "cargarv": "10",
    "guardarv": "11",

    "suma": "00000",
    "mult": "00010",
    "sumita": "10101",
    "cad": "11001",
    "cld": "11010",
    "cli": "11011",
    "unioncita": "11100",

    "igual": "10",
    "brinco": "00",

    "sumvec": "00000",
    "multvec": "00001",
    "cadvec": "11001",
    "cldvec": "11010",
    "clivec": "11011",
    "univecita": "11100"  
}


# Insert stall after a label 
def stallInsertionAfterLabel(instructionElementsList):

    stall = ['suma', 'r15', 'r15', 'r15', "********************"]
    
    result = instructionElementsList.copy()

    i = 0
    # loop to iterate each instruction
    for j in result:       

        if(len(j) == 1):
            result.insert(i + 1, stall)

        i += 1

    return result


# case 0: control risks
def stallInsertionCase0(instructionElementsList, typeDictionary):

    stall = ['suma', 'r15', 'r15', 'r15', "********************"]

    result = instructionElementsList.copy()


    i = 0
    # loop to iterate each instruction
    for j in result:       

        if(len(j) > 1):

            currentInstruction = j[0]

            currentInstructionType = typeDictionary[currentInstruction]

            # control instruction
            if(currentInstructionType == "10"):

                result.insert(i + 1, stall)
                result.insert(i + 2, stall)
                result.insert(i + 3, stall)
                result.insert(i + 4, stall)           

        i += 1

    return result

# case 1: dependencies between instructions with 0 instructions between them
def stallInsertionCase1(instructionElementsList, typeDictionary, opcodeDictionary):

    result = instructionElementsList.copy()

    # this insertion avoids index out of range error
    result.append("*")

    stall = ['suma', 'r15', 'r15', 'r15', "********************"]

    i = 0

    # loop to iterate each instruction
    for j in result:

        if(len(j) > 1):

            if(result[i + 1] == "*"):
                break

            currentInstruction = j[0]

            currentInstructionType = typeDictionary[currentInstruction]
            
            currentDestiny = j[1]

            if(currentDestiny != "r15"):
 
                # instruction
                if(len(result[i + 1]) > 1):

                    nextinstructionElementsList = result[i + 1]

                # label
                else:

                    nextinstructionElementsList = result[i + 2]

                nextInstruction = nextinstructionElementsList[0]

                nextInstructionType = typeDictionary[nextInstruction]           

                # memory instruction
                if(currentInstructionType == "00" and currentInstruction == "cargar"):

                    # control instruction
                    if(nextInstructionType == "10"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextBranch = nextOpcode[0]

                        # conditional instruction
                        if(nextBranch == "1"):

                            nextSource1 = nextinstructionElementsList[1]
                            nextSource2 = nextinstructionElementsList[2]

                            if(currentDestiny == nextSource1 or currentDestiny == nextSource2):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                                result.insert(i + 3, stall)

                    # memory instruction
                    elif(nextInstructionType == "00"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextIns = nextOpcode
                        
                        # guardar instruction
                        if(nextIns == "01"):

                            nextSource = nextinstructionElementsList[1]
                            nextDestiny = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource or currentDestiny == nextDestiny):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                                result.insert(i + 3, stall)
                        
                        # cargar instruction
                        else:

                            nextSource = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                                result.insert(i + 3, stall)

                    # data instruction
                    else:

                        nextSource2 = nextinstructionElementsList[2]
                        nextSource3 = nextinstructionElementsList[3]

                        if(currentDestiny == nextSource2 or currentDestiny == nextSource3):

                            result.insert(i + 1, stall)
                            result.insert(i + 2, stall)
                            result.insert(i + 3, stall)

                # guardar - cargar particular dependency scenario
                elif (currentInstruction == "guardar" and nextInstruction == "cargar"):
                    result.insert(i + 1, stall)
                    result.insert(i + 2, stall)
                    result.insert(i + 3, stall)     

                # data instruction
                else:
                    
                    # control instruction
                    if(nextInstructionType == "10"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextBranch = nextOpcode[0]

                        # conditional instruction
                        if(nextBranch == "1"):

                            nextSource1 = nextinstructionElementsList[1]
                            nextSource2 = nextinstructionElementsList[2]

                            if(currentDestiny == nextSource1 or currentDestiny == nextSource2):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                                result.insert(i + 3, stall)
                        
                    # memory instruction
                    elif(nextInstructionType == "00"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextIns = nextOpcode
                        
                        # guardar instruction
                        if(nextIns == "01"):

                            nextSource = nextinstructionElementsList[1]
                            nextDestiny = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource or currentDestiny == nextDestiny):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                                result.insert(i + 3, stall)
                        
                        # cargar instruction
                        else:

                            nextSource = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                                result.insert(i + 3, stall)

                    # data instruction
                    elif(nextInstructionType == "01"):

                        nextSource2 = nextinstructionElementsList[2]
                        nextSource3 = nextinstructionElementsList[3]

                        if(currentDestiny == nextSource2 or currentDestiny == nextSource3):

                            result.insert(i + 1, stall)
                            result.insert(i + 2, stall)
                            result.insert(i + 3, stall)

        i += 1

    return result[:-1]

# case 2: dependencies between instructions with 1 instruction among them
# instructionElementsList => string list
# typeDictionary => string dictionary
# opcodeDictionary => string dictionary
def stallInsertionCase2(instructionElementsList, typeDictionary, opcodeDictionary):

    result = instructionElementsList.copy()

    # this insertion avoids index out of range error
    result.append("*")

    stall = ['suma', 'r15', 'r15', 'r15', "********************"]

    i = 0

    # loop to iterate each instruction
    for j in result:

        if(len(j) > 1):

            if(result[i + 2] == "*"):
                break

            currentInstruction = j[0]

            currentInstructionType = typeDictionary[currentInstruction]


            currentDestiny = j[1]

            if(currentDestiny != "r15"):

                # instruction
                if(len(result[i + 2]) > 1):

                    nextinstructionElementsList = result[i + 2]

                # label
                else:

                    nextinstructionElementsList = result[i + 3]

                nextInstruction = nextinstructionElementsList[0]

                nextInstructionType = typeDictionary[nextInstruction]           
                    
                # memory instruction
                if(currentInstructionType == "00" and currentInstruction == "cargar"):            
                    
                    # control instruction
                    if(nextInstructionType == "10"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextBranch = nextOpcode[0]

                        # conditional instruction
                        if(nextBranch == "1"):

                            nextSource1 = nextinstructionElementsList[1]
                            nextSource2 = nextinstructionElementsList[2]

                            if(currentDestiny == nextSource1 or currentDestiny == nextSource2):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)

                    # memory instruction
                    elif(nextInstructionType == "00"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextIns = nextOpcode
                        
                        # guardar instruction
                        if(nextIns == "01"):

                            nextSource = nextinstructionElementsList[1]
                            nextDestiny = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource or currentDestiny == nextDestiny):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                        
                        # cargar instruction
                        else:

                            nextSource = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                                        
                    # data instruction
                    elif(nextInstructionType == "01"):

                        nextSource2 = nextinstructionElementsList[2]
                        nextSource3 = nextinstructionElementsList[3]

                        if(currentDestiny == nextSource2 or currentDestiny == nextSource3):

                            result.insert(i + 1, stall)
                            result.insert(i + 2, stall)

                # guardar - cargar particular dependency scenario
                elif (currentInstruction == "guardar" and nextInstruction == "cargar"):
                    result.insert(i + 1, stall)
                    result.insert(i + 2, stall)  

                # data instruction
                elif(nextInstructionType == "01"):
                    
                    # control instruction
                    if(nextInstructionType == "10"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextBranch = nextOpcode[0]

                        # conditional instruction
                        if(nextBranch == "1"):

                            nextSource1 = nextinstructionElementsList[1]
                            nextSource2 = nextinstructionElementsList[2]

                            if(currentDestiny == nextSource1 or currentDestiny == nextSource2):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)

                    # memory instruction
                    elif(nextInstructionType == "00"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextIns = nextOpcode
                        
                        # guardar instruction
                        if(nextIns == "01"):

                            nextSource = nextinstructionElementsList[1]
                            nextDestiny = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource or currentDestiny == nextDestiny):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)
                        
                        # cargar instruction
                        else:

                            nextSource = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource):

                                result.insert(i + 1, stall)
                                result.insert(i + 2, stall)

                    # data instruction
                    elif(nextInstructionType == "01"):

                        nextSource2 = nextinstructionElementsList[2]
                        nextSource3 = nextinstructionElementsList[3]

                        if(currentDestiny == nextSource2 or currentDestiny == nextSource3):

                            result.insert(i + 1, stall)
                            result.insert(i + 2, stall)

        i += 1

    return result[:-1]

# case 3: dependencies between instructions with 2 instructions among them
# instructionElementsList => string list
# typeDictionary => string dictionary
# opcodeDictionary => string dictionary
def stallInsertionCase3(instructionElementsList, typeDictionary, opcodeDictionary):

    result = instructionElementsList.copy()

    # this insertion avoids index out of range error
    result.append("*")

    stall = ['suma', 'r15', 'r15', 'r15', "********************"]


    i = 0
    # loop to iterate each instruction
    for j in result:

        if(len(j) > 1):

            if(result[i + 3] == "*"):
                break

            currentInstruction = j[0]

            currentInstructionType = typeDictionary[currentInstruction]

            currentDestiny = j[1]

            if(currentDestiny != "r15"):

                # instruction
                if(len(result[i + 3]) > 1):

                    nextinstructionElementsList = result[i + 3]

                # label
                else:

                    nextinstructionElementsList = result[i + 4]

                nextInstruction = nextinstructionElementsList[0]

                nextInstructionType = typeDictionary[nextInstruction]           
                    
                # memory instruction
                if(currentInstructionType == "00" and currentInstruction == "cargar"):            
                    
                    # control instruction
                    if(nextInstructionType == "10"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextBranch = nextOpcode[0]

                        # conditional instruction
                        if(nextBranch == "1"):

                            nextSource1 = nextinstructionElementsList[1]
                            nextSource2 = nextinstructionElementsList[2]

                            if(currentDestiny == nextSource1 or currentDestiny == nextSource2):

                                result.insert(i + 1, stall)
                    
                    # memory instruction
                    elif(nextInstructionType == "00"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextIns = nextOpcode
                        
                        # guardar instruction
                        if(nextIns == "01"):

                            nextSource = nextinstructionElementsList[1]
                            nextDestiny = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource or currentDestiny == nextDestiny):

                                result.insert(i + 1, stall)
                        
                        # cargar instruction
                        else:

                            nextSource = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource):

                                result.insert(i + 1, stall)

                    # data instruction
                    else:

                        nextSource2 = nextinstructionElementsList[2]
                        nextSource3 = nextinstructionElementsList[3]

                        if(currentDestiny == nextSource2 or currentDestiny == nextSource3):

                            result.insert(i + 1, stall)
                # guardar - cargar particular dependency scenario
                elif (currentInstruction == "guardar" and nextInstruction == "cargar"):
                    result.insert(i + 1, stall)

                # data instruction
                else:
                    
                    # control instruction
                    if(nextInstructionType == "10"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextBranch = nextOpcode[0]

                        # conditional instruction
                        if(nextBranch == "1"):

                            nextSource1 = nextinstructionElementsList[1]
                            nextSource2 = nextinstructionElementsList[2]

                            if(currentDestiny == nextSource1 or currentDestiny == nextSource2):

                                result.insert(i + 1, stall)

                    # memory instruction
                    elif(nextInstructionType == "00"):

                        nextOpcode = opcodeDictionary[nextInstruction]

                        nextIns = nextOpcode
                        
                        # guardar instruction
                        if(nextIns == "01"):

                            nextSource = nextinstructionElementsList[1]
                            nextDestiny = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource or currentDestiny == nextDestiny):

                                result.insert(i + 1, stall)
                        
                        # cargar instruction
                        else:

                            nextSource = nextinstructionElementsList[3]

                            if(currentDestiny == nextSource):

                                result.insert(i + 1, stall)

                    # data instruction
                    else:

                        nextSource2 = nextinstructionElementsList[2]
                        nextSource3 = nextinstructionElementsList[3]

                        if(currentDestiny == nextSource2 or currentDestiny == nextSource3):

                            result.insert(i + 1, stall)

        i += 1

    return result[:-1]

# instructionElementsList => string list
# typeDictionary => string dictionary
# opcodeDictionary => string dictionary
def riskControlUnit(instructionElementsList):
    global typeDictionary, opcodeDictionary
    case0 = stallInsertionCase0(instructionElementsList, typeDictionary)
    case1 = stallInsertionCase1(case0, typeDictionary, opcodeDictionary)
    case2 = stallInsertionCase2(case1, typeDictionary, opcodeDictionary)
    case3 = stallInsertionCase3(case2, typeDictionary, opcodeDictionary)    
    caseAfterLabel = stallInsertionAfterLabel(case3)

    return caseAfterLabel