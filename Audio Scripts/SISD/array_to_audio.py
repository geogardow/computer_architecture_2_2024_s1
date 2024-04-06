import wave
import numpy as np

def array_to_audio(array, path, sample_rate):
    sample_width = 2  # 2 bytes (16-bit)
    num_channels = 1  # Mono audio

    with wave.open(path, "w") as wf:
        wf.setnchannels(num_channels)
        wf.setsampwidth(sample_width)
        wf.setframerate(sample_rate*2)

        # Convert and write the audio data to the file
        audio_array = np.array([int(x * 32767) for x in array])  # Scale to 16-bit range
        #print(audio_array)
        wf.writeframes(audio_array.tobytes())
    print("WAV file created successfully.")