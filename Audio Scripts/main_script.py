from audio_to_array import *
from float_array_to_fixed import *
from fixed_array_to_float import *
from array_to_audio import *
from array_to_file import *
from filter_audio import *

SAMPLE_RATE = 44100
AUDIO_LENGTH = 5

audio_array = audio_to_array("./Audio Scripts/original.wav", SAMPLE_RATE, AUDIO_LENGTH)
filtered_array = filter_audio(audio_array, SAMPLE_RATE, AUDIO_LENGTH, 16, 16)
#fixed_array = float_array_to_fixed(audio_array, 7, 8)
#array_to_file(fixed_array, "./Audio Scripts/audio.txt")
#built_array = fixed_array_to_float(fixed_array, 7, 8)
#print(filtered_array)
array_to_audio(filtered_array, "./Audio Scripts/rebuilt.wav",SAMPLE_RATE)
