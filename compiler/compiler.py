"""Module to make a translation from our ISA to binary and mif file."""

from stalls import riskControlUnit
from labelsDictionary import getLabelDictionary
from binaryTranslate import binaryInstructions
from mifConverter import convert_to_mif
import re
import argparse
import os

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

def remove_comments_from_file(file_path):
    """Remove comments from a file."""
    with open(file_path, 'r', encoding="utf-8") as file:
        lines = file.readlines()

    # Usamos una expresión regular para encontrar y eliminar comentarios
    non_comments_lines = [re.sub(r'//.*', '', line) for line in lines]

    with open(file_path, 'w', encoding="utf-8") as file:
        file.writelines(non_comments_lines)


def borrar_archivos_directorio(directorio):
    """
    Borra todos los archivos dentro de un directorio dado.
    
    Args:
        directorio (str): Ruta al directorio del cual se borrarán los archivos.
    """
    # Verificar si el directorio existe
    if not os.path.exists(directorio):
        print(f"El directorio '{directorio}' no existe.")
        return
    
    # Recorrer los archivos dentro del directorio
    for archivo in os.listdir(directorio):
        ruta_completa = os.path.join(directorio, archivo)
        if os.path.isfile(ruta_completa):
            os.remove(ruta_completa)
            print(f"Archivo '{archivo}' eliminado.")
        else:
            print(f"'{archivo}' no es un archivo.")


if __name__ == '__main__':
    FOLDER_PATH = "./compiler/"
    parser = argparse.ArgumentParser(description='Compiler for our ISA.')
    parser.add_argument('file', nargs='?', type=str, default='NONE', help='File to compile.')
    args = parser.parse_args()

    # Borrar archivos de los directorios 'binary' y 'output' y 'data'
    borrar_archivos_directorio(FOLDER_PATH + 'binary')
    borrar_archivos_directorio(FOLDER_PATH + 'output')
    borrar_archivos_directorio(FOLDER_PATH + 'data')


    if args.file == "NONE":  
        listFiles = ["simd_8","simd_16","simd_31","sisd"]
    else:
        listFiles = ["full_code"]
    FOLDER_PATH2 = "./compiler/code/"
    for file in listFiles:
        SCRIPT_FILE_PATH = FOLDER_PATH2 + file+".txt"
        remove_blank_lines_from_file(SCRIPT_FILE_PATH)
        remove_comments_from_file(SCRIPT_FILE_PATH)
        instruction_elements_list = get_instruction_elements_list(SCRIPT_FILE_PATH)

        instruction_elements_list = riskControlUnit(instruction_elements_list)

        labelDictionary, instruction_elements_list = getLabelDictionary(instruction_elements_list)

        print(instruction_elements_list)
        print(labelDictionary)
        binaryInstructions(FOLDER_PATH + f'binary/binaryCode-{file}.txt', instruction_elements_list, labelDictionary)

        input_file = FOLDER_PATH + f'binary/binaryCode-{file}.txt'
        output_file = FOLDER_PATH + f'output/output-{file}.mif'

        convert_to_mif(input_file, output_file)
        print(f"\033[32mThe file {file}.txt has been compiled successfully.\033[0m")
        
