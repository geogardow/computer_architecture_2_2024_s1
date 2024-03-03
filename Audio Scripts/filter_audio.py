from scipy.signal import kaiserord, firwin, freqz
import numpy as np
import math

def normalize_array(array):
    mu = np.mean(array, 0)
    sigma = np.std(array, 0)
    array = (array - mu ) / sigma

    max_value = array.max()
    min_value = array.min()
    normalized_array = -1 + 2 * (array - min_value) / (max_value - min_value)
    return normalized_array

def get_b_vector(sample_rate, audio_length, cutoff_hz =20000.0, ripple_db = 1200.0):# Frecuencia de corte deseada en Hz # Atenuación en la banda de parada (en decibeles)
    num_taps = sample_rate * audio_length  # Tamaño del vector b

    # Diseña el filtro FIR utilizando la ventana de Hamming
    taps = firwin(num_taps, cutoff_hz / (0.5 * sample_rate), window='hamming', pass_zero=True) #pasa bajas
    # El vector b contiene los coeficientes del filtro FIR
    return taps

def filter_audio(x, sample_rate, audio_length, N=16):
    x = np.array(x)
    y = np.zeros(len(x))
    b = list(normalize_array(get_b_vector(sample_rate, audio_length)))
    b.reverse()
    b = np.array(b)

    print(len(x))
    print(len(b))
    
    for iterations in range(0, len(x), N):
        y[iterations : iterations + N] = np.multiply(x[iterations : iterations + N], b[iterations : iterations + N])
    y[iterations:] = np.multiply(x[iterations:], b[iterations:])
    for index in range(1,len(y)):
        y[index] = y[index - 1] + y[index]

    return list(normalize_array(y))
        



    
    
