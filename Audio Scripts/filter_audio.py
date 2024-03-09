from scipy.signal import kaiserord, firwin, freqz
import numpy as np
import math

RV = np.zeros((32, 16))
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
    return taps

def filter_audio(x, sample_rate, audio_length, Nx=16, Nb=16):
    x = np.array(x)
    y = np.zeros(len(x))
    b = list(normalize_array(get_b_vector(order=Nb)))
    b.reverse()
    b = np.array(b)

    # Vamos a simular x, b y y como memoria, de modo que cada vez que se obtenga un valor o sección de alguno de ellos es un load
    # y si se asigna un valor o sección a ellos, es un store

    R[0] = 0 #Acceso a memoria del vector x
    R[1] = 0 #Acceso a memoria del vector b
    R[3] = 0 #Acceso a memoria del vector y
    print(R[0])

    while True:                                 # MAIN:
        RV[0] = x[int(R[0]):int(R[0])+Nx]       # LDRVRC RV0, [R1]              # Carga de memoria el vector x[]
        R[2] = b[int(R[1])]                     # LDR R2, [R1]                  # Carga el valor b a multiplicar

                                                # Aquí se llama al branch link para multiplicación
        RV[0] = RV[0] * R[2]                    # MULTVECESC RV0, RV0, R2       # Mulplica x[]*b
                                                # Aquí se retorna del branch link


        RV[1] = RV[1] + RV[0]                   # ADDVEC RV1, RV1, RV0          # RV1 Almacena el acumulado de cada 16 muestras

        R[0] = R[0] + 1                         # ADD R0, R0, #1                # Añadir valor de salto, no se si 1 o 4, depende
        R[1] = R[1] + 1                         # ADD R1, R1, #1                # Añadir valor de salto, no se si 1 o 4, depende

        if R[1] >= Nb:                          # CMP R1, #16                   # Verifica que no nos salgamos del tamaño del vector b, puede ser 16*salto
                                                # BGE RESET_B_OFFSET            # Llama al branch de reseteo
                                        
                                                # RESET_B_OFFSET:
            R[1] = 0                            # MOV R1, #0                    # Resetea el valor a acceder en b al que sea donde esté b
            y[int(R[3]):int(R[3])+Nx] = RV[1]   # STR RV1, [R3]                 # Guarda las 16 muestras de y
            R[3] = R[0]                         # MOV R3, R0                    # Actualiza el valor de acceso de memoria de y
            RV[1] = np.zeros(16)                # MOVVEC RV1, #0
                                                # B MAIN

        else:                                           # Este es el caso donde no pasó nada
            if R[0] >= audio_length*sample_rate - Nb:   # CMP R0, #FINAL DEL AUDIO - Nb muestras
                return list(normalize_array(y))         # BGE END
            else:
                pass                                    # B MAIN
        



    
    
