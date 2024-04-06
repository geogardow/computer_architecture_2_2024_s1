import numpy as np
import wave

def normalize_array(array):
    mu = np.mean(array, 0)
    sigma = np.std(array, 0)
    array = (array - mu ) / sigma

    max_value = array.max()
    min_value = array.min()
    normalized_array = (array - min_value) / (max_value - min_value)
    return normalized_array

def audio_to_array(path, sampling_rate, time):
    try:
        # Open the WAV file
        with wave.open(path, 'rb') as wav_file:
            # Check if the WAV file's sample width is 16 bits
            if wav_file.getsampwidth() != 2:
                print("The WAV file must have a sample width of 16 bits.")
                return None

            # Read audio samples from the WAV file
            audio_samples = np.frombuffer(wav_file.readframes(-1), dtype=np.int16)

            # Check if the WAV file is stereo (2 channels) and convert to mono if needed
            if wav_file.getnchannels() == 2:
                audio_samples = audio_samples[::2]

            audio_samples_normalized = normalize_array(audio_samples)[:wav_file.getframerate()*time]
            audio_resample = []
            for i in range(sampling_rate*time):
                audio_resample.append(audio_samples_normalized[int((wav_file.getframerate()/sampling_rate)*i)])
            return audio_resample
        
    except FileNotFoundError:
        print("File not found.")
        return None
    except Exception as e:
        print(f"An error occurred: {str(e)}")

