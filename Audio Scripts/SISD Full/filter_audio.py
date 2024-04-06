from scipy.signal import kaiserord, firwin, freqz
from fixed_point_operations import *
import numpy as np
import math

R = null_vec(32)

def normalize_array(array):
    mu = np.mean(array, 0)
    sigma = np.std(array, 0)
    array = (array - mu ) / sigma

    max_value = array.max()
    min_value = array.min()
    normalized_array = (array - min_value) / (max_value - min_value)
    return normalized_array

def get_b_vector(order=16, filter_freq=1000, cut_freq=100):
    taps = firwin(order, cut_freq/(filter_freq/2))
    taps = list(normalize_array(taps))
    taps.reverse()
    taps = np.array(taps)
    return taps

def filter_audio(x, b, sample_rate, audio_length, Nx=16, Nb=16):
    x = np.array(x)
    y = np.zeros(len(x))

    # Vamos a simular x, b y y como memoria, de modo que cada vez que se obtenga un valor o sección de alguno de ellos es un load
    # y si se asigna un valor o sección a ellos, es un store

    R[0] = "0000000000000000"                   # MOV R0, #ADDRESS              #Acceso a memoria del vector x
    R[1] = "0000000000000000"                   # MOV R1, #ADDRESS              #Acceso a memoria del vector b
    R[3] = "0000000000000000"                   # MOV R3, #ADDRESS              #Acceso a memoria del vector y
    R[6] = "0000000000000000"                   #Contador b
    R[7] = "0000000000000000"                   #Suma de contador con memoria
    R[11] = "0000000000000000"                  #Contador x

    while True:                                 # MAIN:
        R[9] = x[int(R[0],2)]                   # LDR R9, [R0]                  # Carga de memoria el dato x[]

        R[7] = add(R[1], R[6])                  # ADD R7, R1, R6                # Suma de contador con memoria
        R[2] = b[int(R[7],2)]                     # LDR R2, [R7]                  # Carga el valor b a multiplicar


                                                
        R[13] = cadvec(RV[0], 8)                        # CADVEC RV2, RV0, #8                           # a
        
        RV[14] = andvecesc(RV[0], '0000000011111111')    # ANDVECESC RV3, RV0, 0000000011111111          # b
        R[4] = cad(R[2], 8)                             # CAD R4, R2, #8                                # c
        R[5] = andf(R[2], '0000000011111111')           # AND R5, R2, 0000000011111111                  # d
        R[15] = multvecesc(R[13], R[4])                 # MULTVECESC RV4, RV2, R4                       # high = a × c
        R[15] = clivec(R[15], 8)                        # CLIVEC RV4, RV4, #8                           # high << 8
        R[16] = multvecesc(R[13], R[5])                 # MULTVECESC RV5, RV2, R5                       # mid1 = a × d
        R[17] = multvecesc(R[14], R[4])                 # MULTVECESC RV6, RV3, R4                       # mid2 = b × c
        R[16] = addvec(R[16], R[17])                    # ADDVEC RV5, RV5, RV6                          # mid = mid1 + mid2
        R[17] = multvecesc(R[14], R[5])                 # MULTVECESC RV6, RV3, R5                       # low = b × d
        R[17] = cadvec(R[17], 8)                        # CADVEC RV6, RV6, #8                           # low >> 8
        R[17] = addvec(R[17], R[16])                    # ADDVEC RV0, RV6, RV5                          # result = low + mid
        R[17] = addvec(R[00], R[15])                    # ADDVEC RV0, RV0, RV4                          # result = result + high



        R[12] = R[12] + R[9]                    # ADD R12, R12, R9              # RV1 Almacena el acumulado de cada 16 muestras
        
        R[0] = R[0] + 1                         # ADD R0, R0, #1                # Añadir valor de salto, no se si 1 o 4, depende
        R[6] = R[6] + 1                         # ADD R6, R6, #1                # Añadir valor de salto, no se si 1 o 4, depende
        R[11] = R[11] + 1                       # ADD R11, R11, #1              # Añadir valor de salto, no se si 1 o 4, depende
        
        if R[6] >= Nb:                          # CMP R6, #16                   # Verifica que no nos salgamos del tamaño del vector b, puede ser 16*salto
                                                # BGE RESET_B_OFFSET            # Llama al branch de reseteo                         
                                                # RESET_B_OFFSET:
            R[6] = 0                            # MOV R6, #0                    # Resetea el valor a acceder en b al que sea donde esté b
            continue                            # B MAIN
                                                
                                                # RESTART_LOOP:
        if R[11] >= Nx:                         # CMP R11, #16                  # Verifica que no nos salgamos del tamaño del vector x, puede ser 16*salto
            
            R[11] = 0                           # MOV R11, #0                   # Resetea el valor a acceder en x al que sea donde esté x
            y[int(R[3])] = R[12]                # STR R12, [R3]                 # Guarda las 16 muestras de y
            R[3] = R[3] + 1                     # ADD R3, R3, #1                # Añadir valor de salto, no se si 1 o 4, depende
            R[0] = R[3]                         # MOV R0, R3                    # Mueve el puntero de x al de y
            R[12] = 0                           # MOV R12, #0                   # Resetea el acumulado de y

        else:                                           # Este es el caso donde no pasó nada
            if R[0] >= audio_length*sample_rate - Nx - 1:   # CMP R0, #FINAL DEL AUDIO - Nb muestras
                return list(normalize_array(y))         # BGE END
            else:
                pass                                    # B MAIN
        


RV = null_mat(32, 16)
R = null_vec(32)

def filter_audio(x, b, Nx=16, Nb=16, sample_rate=44100, audio_length=5):
    x = np.array(x)
    y = null_vec(len(x))
  
    # Vamos a simular x, b y y como memoria, de modo que cada vez que se obtenga un valor o sección de alguno de ellos es un load
    # y si se asigna un valor o sección a ellos, es un store

    R[0] = "0000000000000000"                   # MOV R0, #ADDRESS              #Acceso a memoria del vector x
    R[1] = "0000000000000000"                   # MOV R1, #ADDRESS              #Acceso a memoria del vector b
    R[3] = "0000000000000000"                   # MOV R3, #ADDRESS              #Acceso a memoria del vector y
    R[6] = "0000000000000000"                   #Contador b
    R[7] = "0000000000000000"                   #Suma de contador con memoria
    R[11] = "0000000000000000"                  #Contador x

    while True:                                 # MAIN:
        RV[0] = x[int(R[0],2):int(R[0],2)+Nx]   # LDRVEC RV0, [R0]              # Carga de memoria el vector x[]
        R[7] = add(R[1], R[6])                  # ADD R7, R1, R6                # Suma de contador con memoria
        R[2] = b[int(R[7],2)]                   # LDR R2, [R7]                  # Carga el valor b a multiplicar

                                                        # BL MULTIPLICATION        
                                                        # Tomamos el vector como Qa.b y b como Qc.d
        RV[2] = cadvec(RV[0], 8)                        # CADVEC RV2, RV0, #8                           # a
        
        RV[3] = andvecesc(RV[0], '0000000011111111')    # ANDVECESC RV3, RV0, 0000000011111111          # b
        R[4] = cad(R[2], 8)                             # CAD R4, R2, #8                                # c
        R[5] = andf(R[2], '0000000011111111')           # AND R5, R2, 0000000011111111                  # d
        RV[4] = multvecesc(RV[2], R[4])                 # MULTVECESC RV4, RV2, R4                       # high = a × c
        RV[4] = clivec(RV[4], 8)                        # CLIVEC RV4, RV4, #8                           # high << 8
        RV[5] = multvecesc(RV[2], R[5])                 # MULTVECESC RV5, RV2, R5                       # mid1 = a × d
        RV[6] = multvecesc(RV[3], R[4])                 # MULTVECESC RV6, RV3, R4                       # mid2 = b × c
        RV[5] = addvec(RV[5], RV[6])                    # ADDVEC RV5, RV5, RV6                          # mid = mid1 + mid2
        RV[6] = multvecesc(RV[3], R[5])                 # MULTVECESC RV6, RV3, R5                       # low = b × d
        RV[6] = cadvec(RV[6], 8)                        # CADVEC RV6, RV6, #8                           # low >> 8
        RV[0] = addvec(RV[6], RV[5])                    # ADDVEC RV0, RV6, RV5                          # result = low + mid
        RV[0] = addvec(RV[0], RV[4])                    # ADDVEC RV0, RV0, RV4                          # result = result + high
                                                        # BL RETURN


        RV[1] = addvec(RV[1], RV[0])            # ADDVEC RV1, RV1, RV0          # RV1 Almacena el acumulado de cada 16 muestras

        R[0] = add(R[0], "0000000000000001")    # ADD R0, R0, #1                # Añadir valor de salto, no se si 1 o 4, depende
        R[6] = add(R[6], "0000000000000001")    # ADD R6, R6, #1                # Añadir valor de salto, no se si 1 o 4, depende
        R[11] = add(R[11], "0000000000000001")  # ADD R11, R11, #1              # Añadir valor de salto, no se si 1 o 4, depende

        if int(R[6],2) >= Nb:                          # CMP R6, #16                   # Verifica que no nos salgamos del tamaño del vector b, puede ser 16*salto
                                                # BGE RESET_B_OFFSET            # Llama al branch de reseteo
                                        
                                                    # RESET_B_OFFSET:
            R[6] = "0000000000000000"               # MOV R6, #0                    # Resetea el valor a acceder en b al que sea donde esté b
            continue                                # B MAIN

        if int(R[11],2) >= Nx:                      # CMP R11, #16                  # Verifica que no nos salgamos del tamaño del vector x, puede ser 16*salto
        
            R[11] = "0000000000000000"              # MOV R11, #0                   # Resetea el valor a acceder en x al que sea donde esté x
            y[int(R[3],2):int(R[3],2)+Nx] = RV[1]   # STR RV1, [R3]                 # Guarda las 16 muestras de y
            R[3] = R[0]                             # MOV R3, R0                    # Actualiza el valor de acceso de memoria de y
            RV[1] = null_vec(Nb)                    # MOVVEC RV1, #0

        else:                                                       # Este es el caso donde no pasó nada
            if int(R[0],2) >= audio_length*sample_rate - Nx - 1:    # CMP R0, #FINAL DEL AUDIO - Nb muestras
                return y                                            # BGE END
            else:
                pass                                                # B MAIN
        



    
    

    
    
