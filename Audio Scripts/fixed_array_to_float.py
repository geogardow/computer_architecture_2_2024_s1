from audio_to_array import normalize_array

def fixed_array_to_float(samples, int_bits=7, float_bits=8):
    samples_float = []
    for element in samples:
        sign = 1
        if element[0] == "1":
            sign = -1
        decimal = int(element[1:int_bits+1], 2)
        for i in range(float_bits):
            decimal += 2**(-(i+1))*int(element[int_bits + 1 + i])
        samples_float.append(decimal*sign)

    return list(normalize_array(samples_float))