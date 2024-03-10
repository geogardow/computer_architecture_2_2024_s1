from scipy.signal import kaiserord, firwin, freqz
import numpy as np
from audio_to_array import normalize_array

def get_b_vector(order=16, filter_freq=20000, cut_freq=100):
    taps = firwin(order, cut_freq/(filter_freq/2), pass_zero=True)
    taps = list(normalize_array(taps))
    taps.reverse()
    taps = np.array(taps)
    return taps