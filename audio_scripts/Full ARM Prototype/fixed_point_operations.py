import numpy as np

def clivec(array, shift):
    shifted_array = np.empty_like(array)
    for i in range(len(array)):
        shifted_array[i] = array[i][shift:] + '0' * shift
    return shifted_array

def cadvec(array, shift):
    shifted_array = np.empty_like(array)
    for i in range(len(array)):
        shifted_array[i] = '0' * shift + array[i][:-shift]
    return shifted_array
    
def multvecesc(array, binary_number):
    result_array = np.empty_like(array)
    for i in range(len(array)):
        result = bin(int(array[i], 2) * int(binary_number, 2))[2:].zfill(16)
        result_array[i] = result[-16:]
    return result_array

def multvec(array1, array2):
    result_array = np.empty_like(array1)
    for i in range(len(array1)):
        result = bin(int(array1[i], 2) * int(array2[i], 2))[2:].zfill(16)
        result_array[i] = result[-16:]
    return result_array

def addvecesc(array, binary_number):
    result_array = np.empty_like(array)
    for i in range(len(array)):
        result = bin(int(array[i], 2) + int(binary_number, 2))[2:].zfill(16)
        result_array[i] = result[-16:]
    return result_array

def addvec(array1, array2):
    result_array = np.empty_like(array1)
    for i in range(len(array1)):
        result = bin(int(array1[i], 2) + int(array2[i], 2))[2:].zfill(16)
        result_array[i] = result[-16:]
    return result_array

def andvecesc(array, binary_number):
    result_array = np.empty_like(array)
    for i in range(len(array)):
        result = bin(int(array[i], 2) & int(binary_number, 2))[2:].zfill(16)
        result_array[i] = result[-16:]
    return result_array

def andf(binary_number1, binary_number2):
    result = bin(int(binary_number1, 2) & int(binary_number2, 2))[2:].zfill(16)
    return result[-16:]

def cad(binary_number, shift):
    binary_out = '0' * shift + binary_number[:-shift]
    return binary_out

def cli(binary_number, shift):
    binary_out = binary_number[shift:] + '0' * shift
    return binary_out

def null_vec(length):
    lista = []
    for i in range(length):
        lista.append("0000000000000000")
    return np.array(lista)

def null_mat(m, n):
    lista = []
    for i in range(m):
        lista.append(null_vec(n))
    return np.array(lista)

def add(binary_number1, binary_number2):
    result = bin(int(binary_number1, 2) + int(binary_number2, 2))[2:].zfill(16)
    return result[-16:]


