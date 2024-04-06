from scipy.signal import kaiserord, firwin, freqz
import numpy as np
from audio_to_array import normalize_array

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