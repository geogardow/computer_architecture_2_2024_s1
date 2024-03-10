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
SAMPLE_RATE = 44100
AUDIO_LENGTH = 5

audio_array = audio_to_array("./Audio Scripts/original.wav", SAMPLE_RATE, AUDIO_LENGTH)
b_vector = get_b_vector(order=16)
fixed_audio_array = float_array_to_fixed(audio_array, INTBITS, FLOATBITS)
#array_to_file(fixed_array, "./Audio Scripts/audio.txt")
fixed_b_vector = float_array_to_fixed(b_vector, INTBITS, FLOATBITS)
filtered_fixed_audio_array = filter_audio(fixed_audio_array, fixed_b_vector)
built_array = fixed_array_to_float(filtered_fixed_audio_array, INTBITS, FLOATBITS)
array_to_audio(built_array, "./Audio Scripts/rebuilt.wav", SAMPLE_RATE)
