from audio_to_array import *
from float_array_to_fixed import *
from fixed_array_to_float import *
from array_to_audio import *
from array_to_file import *
from filter_audio import *
from mif_builder import *

SAMPLE_RATE = 40000
AUDIO_LENGTH = 5
NB = 16
NX = 16

audio_array = audio_to_array("./Audio Scripts/SISD/original.wav", SAMPLE_RATE, AUDIO_LENGTH)
b_array = get_b_vector(NB)
print(b_array)
fixed_audio_array = float_array_to_fixed(audio_array, 7, 8)
fixed_b_array = float_array_to_fixed(b_array, 7, 8)
mif_builder("./Audio Scripts/SISD/memory.mif", NX, fixed_audio_array, fixed_b_array)
built_array = fixed_array_to_float(fixed_audio_array, 7, 8)
filtered_array = filter_audio(built_array, b_array, SAMPLE_RATE, AUDIO_LENGTH, NX, NB)
array_to_audio(filtered_array, "./Audio Scripts/SISD/rebuilt.wav",SAMPLE_RATE)
