from audio_to_array import *
from float_array_to_fixed import *
from fixed_array_to_float import *
from array_to_audio import *
from array_to_file import *
from filter_audio import *
from vector_b import *
import tensorflow as tf

print(f'TensorFlow {tf.__version__}')
print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
with tf.device('/GPU:0'):
    a = tf.constant([1.0, 2.0, 3.0])

NB = 16
NX = 16
INTBITS = 7
FLOATBITS = 8
SAMPLE_RATE = 20000
AUDIO_LENGTH = 3

audio_array = audio_to_array("./Audio Scripts/Full ARM Prototype/original.wav", SAMPLE_RATE, AUDIO_LENGTH)
print(len(audio_array))
b_vector = get_b_vector(order=16)
fixed_audio_array = float_array_to_fixed(audio_array, INTBITS, FLOATBITS)
#array_to_file(fixed_array, "./Audio Scripts/Full ARM Prototype/audio.txt")
fixed_b_vector = float_array_to_fixed(b_vector, INTBITS, FLOATBITS)
print(fixed_b_vector)
filtered_fixed_audio_array = filter_audio(fixed_audio_array, fixed_b_vector, NX, NB, SAMPLE_RATE, AUDIO_LENGTH)
built_array = fixed_array_to_float(filtered_fixed_audio_array, INTBITS, FLOATBITS)
array_to_audio(built_array, "./Audio Scripts/Full ARM Prototype/rebuilt.wav", SAMPLE_RATE)
print(filtered_fixed_audio_array)
