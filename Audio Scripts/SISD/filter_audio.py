from scipy.signal import kaiserord, firwin, freqz
import numpy as np
import math

R = np.zeros(32)

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

    R[0] = 0 #Acceso a memoria del vector x
    R[1] = 0 #Acceso a memoria del vector b
    R[3] = 0 #Acceso a memoria del vector y
    R[6] = 0 #Contador b
    R[7] = 0 #Suma de contador con memoria
    R[11] = 0 #Contador x

    while True:                                 # MAIN:
        R[9] = x[int(R[0])]                     # LDR R9, [R0]                  # Carga de memoria el dato x[]

        R[7] = R[1] + R[6]                      # ADD R7, R1, R6                # Suma de contador con memoria
        R[2] = b[int(R[7])]                     # LDR R2, [R7]                  # Carga el valor b a multiplicar


                                                
                                                # Aquí se llama al branch link para multiplicación
        R[9] = R[9] * R[2]                      # MULT R9, R9, R2               # Mulplica x*b
                                                # Aquí se retorna del branch link



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
        



    
    
