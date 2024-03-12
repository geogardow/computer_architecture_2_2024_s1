"""Module to make a translation from our ISA to binary and mif file."""


def get_instruction_elements_list(filename):
    """Get the instruction elements list from the code file."""

    # open code.txt file for reading
    with open(filename, 'r', encoding="utf-8") as code_file:
        code_lines = code_file.readlines()

    # variable to store all the instruction elements
    instruction_elements_list_result = []

    # loop to iterate the code file line by line
    for line in code_lines:
        # variable to know if the current instruction is a memory one (type 01)
        memory_flag = 0

        elements = []
        temp = ""

        # slicing the current line to get the last element
        aux = line[-2]

        # current line contains a label
        if aux == ":":
            instruction_elements_list_result.append([line[:-2]])

        # current line contains an instruction
        else:

            #pointerLine += 1

            # loop to iterate the current line char by char
            for char in line:
                if(char == " " or char == "," or char == "(" or char == ")" or char == '\t'):

                    # check if the current instruction is a memory one to change the flag
                    if char == "(":
                        memory_flag = 1

                    if temp != "":
                        elements.append(temp)

                    temp = ""

                else:
                    temp += char

            # slice \n from the last element
            temp = temp[:-1]

            elements.append(temp)
            # remove last element if the current instruction is a memory one
            if memory_flag == 1:
                elements.pop()

            instruction_elements_list_result.append(elements)
    return instruction_elements_list_result

def remove_blank_lines_from_file(file_path):
    """Remove blank lines from a file."""
    with open(file_path, 'r', encoding="utf-8") as file:
        lines = file.readlines()

    non_blank_lines = [line for line in lines if line.strip()]

    with open(file_path, 'w', encoding="utf-8") as file:
        file.writelines(non_blank_lines)

if __name__ == '__main__':
    FOLDER_PATH = "./compiler/"

    SCRIPT_FILE_PATH = FOLDER_PATH + 'full_code.txt'

    remove_blank_lines_from_file(SCRIPT_FILE_PATH)


    instruction_elements_list = get_instruction_elements_list(SCRIPT_FILE_PATH)

    print(instruction_elements_list)
