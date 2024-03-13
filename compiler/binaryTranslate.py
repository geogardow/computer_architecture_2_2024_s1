from stalls import typeDictionary, opcodeDictionary


# register dictionary definition
registerDictionary = {
    "r0": "00000",
    "r1": "00001",
    "r2": "00010",
    "r3": "00011",
    "r4": "00100",
    "r5": "00101",
    "r6": "00110",
    "r7": "00111",
    "r8": "01000",
    "r9": "01001", 
    "r10": "01010",
    "r11": "01011",
    "r12": "01100",
    "r13": "01101",
    "r14": "01110",
    "r15": "01111",
    "r16": "10000",
    "r17": "10001",
    "r18": "10010",
    "r19": "10011",
    "r20": "10100",
    "r21": "10101",
    "r22": "10110",
    "r23": "10111",
    "r24": "11000",
    "r25": "11001",
    "r26": "11010",
    "r27": "11011",
    "r28": "11100",
    "r29": "11101",
    "r30": "11110",
    "r31": "11111",
    "RV0": "00000",
    "RV1": "00001",
    "RV2": "00010",
    "RV3": "00011",
    "RV4": "00100",
    "RV5": "00101",
    "RV6": "00110",
    "RV7": "00111",
    "RV8": "01000",
    "RV9": "01001",
    "RV10": "01010",
    "RV11": "01011",
    "RV12": "01100",
    "RV13": "01101",
    "RV14": "01110",
    "RV15": "01111",
    "RV16": "10000",
    "RV17": "10001",
    "RV18": "10010",
    "RV19": "10011",
    "RV20": "10100",
    "RV21": "10101",
    "RV22": "10110",
    "RV23": "10111",
    "RV24": "11000",
    "RV25": "11001",
    "RV26": "11010",
    "RV27": "11011",
    "RV28": "11100",
    "RV29": "11101",
    "RV30": "11110",
    "RV31": "11111"
}

# number => int
# instructionType => string
# opcode => string
# pointerLine => int
def signExtension(number, instructionType, opcode, pointerLine):

    # control instruction
    if(instructionType == "10"):

        immediate = number - pointerLine

    # memory or data instruction
    else:

        immediate = number

    binary = bin(abs(immediate)).replace("0b", "")

    binaryLength = len(binary)

    # control instruction
    if(instructionType == "10"):

        # conditional instruction
        if(opcode != "00"):

            extension = "0" * (18 - binaryLength)

            binary = extension + binary

            # PC - direction
            if(immediate < 0):

                binary =  twoComplement(binary)

            return binary
            
        # unconditional instruction
        else:

            extension = "0" * (28 - binaryLength)

            binary = extension + binary

            # PC - direction
            if(immediate < 0):

                binary =  twoComplement(binary)

            return binary            

    # memory instruction
    elif(instructionType == "00"):

        extension = "0" * (17 - binaryLength)

        binary = extension + binary

        # PC - direction
        if(immediate < 0):

            binary =  twoComplement(binary)

        return binary 

    # data instruction
    else:

        flagImmediate = opcode[0]

        # immediate
        if(flagImmediate == "1"):

            extension = "0" * (15 - binaryLength)

            binary = extension + binary

            # PC - direction
            if(immediate < 0):

                binary =  twoComplement(binary)

            return binary

# instructionElementsList => string list list
def binaryInstructions(filename, instructionElementsList, labelDictionary):
    global typeDictionary, opcodeDictionary, registerDictionary
    # open binaryCode.txt file for writing
    binaryCodeFile = open(filename, 'w')

    # variable to know the number of the current line
    pointerLine = 0

    #file to write data
    data_path = "./compiler/data.txt"

    for elements in instructionElementsList:

        pointerLine += 1

        #print("elements = ", elements)        
            
        instructionType = typeDictionary[elements[0]]
        opcode = opcodeDictionary[elements[0]]

        fillingMemory = "0"
        fillingData = "0000000000"

        # control instruction
        if(instructionType == "10"):

            conditional = opcode

            # conditional instruction
            if(conditional  !=  "00"):

                register1 = registerDictionary[elements[1]]
                register2 = registerDictionary[elements[2]]

                direction = elements[3]
                direction = labelDictionary[direction]
                direction = signExtension(direction, instructionType, opcode, pointerLine)

                instruction = instructionType + opcode + register1 + register2 + direction
                print(instructionType + " " + opcode + " " + register1 + " " + register2 + " " + direction)

                with open(data_path, "a+") as file:
                    file.write( " ".join(elements)+ "  ")
                    file.write(instructionType + " " + opcode + " " + register1 + " " + register2 + " " + direction + '\n')


            # unconditional instruction
            else:
                direction = elements[1]
                direction = labelDictionary[direction]
                direction = signExtension(direction, instructionType, opcode, pointerLine)

                instruction = instructionType + opcode + direction
                print(instructionType + " " + opcode + " " + direction)

                with open(data_path, "a+") as file:
                    file.write(" ".join(elements)+ "  ")
                    file.write(instructionType + " " + opcode + " " + direction + '\n')

        # memory instruction
        elif(instructionType == "00"):

            register1 = registerDictionary[elements[1]]

            immediate = int(elements[2])
            immediate = signExtension(immediate, instructionType, opcode, pointerLine)

            register2 = registerDictionary[elements[3]]       

            instruction = instructionType + opcode + fillingMemory + register1 + register2 + immediate
            print(instructionType + " " + opcode + " " + fillingMemory + " " + register1 + " " + register2 + " " + immediate)
            
            with open(data_path, "a+") as file:
                file.write(" ".join(elements)+ "  ")
                file.write(instructionType + " " + opcode + " " + fillingMemory + " " + register1 + " " + register2 + " " + immediate+ '\n')

        # data instruction
        else:

            flagImmediate = opcode[0]

            # immediate
            if(flagImmediate == "1"):

                register1 = registerDictionary[elements[1]]
                register2 = registerDictionary[elements[2]]
                
                immediate = int(elements[3])
                immediate = signExtension(immediate, instructionType, opcode, pointerLine)

                instruction = instructionType + opcode + register1 + register2 + immediate

                print(instructionType + " " + opcode + " " + register1 + " " + register2 + " " + immediate)

                with open(data_path, "a+") as file:
                    file.write(" ".join(elements) + "  ")
                    file.write(instructionType + " " + opcode + " " + register1 + " " + register2 + " " + immediate + '\n')

            # no immediate
            else:

                register1 = registerDictionary[elements[1]]
                register2 = registerDictionary[elements[2]]
                register3 = registerDictionary[elements[3]]

                instruction = instructionType + opcode + register1 + register2 + register3 + fillingData

                print(instructionType + " " + opcode + " " + register1 + " " + register2 + " " + register3 + " " + fillingData)

                with open(data_path, "a+") as file:
                    file.write( " ".join(elements)+ "  ")
                    file.write(instructionType + " " + opcode + " " + register1 + " " + register2 + " " + register3 + " " + fillingData+ '\n')
        #print(" ")

        binaryCodeFile.write(instruction + "\n")

    return instructionElementsList
