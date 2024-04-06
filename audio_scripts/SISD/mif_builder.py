def mif_builder(path, width, audio_array, b_array):
    with open(path, "w") as f_out:
        
        depth = len(audio_array) + len(b_array)

        f_out.write("WIDTH = {};\n".format(width))
        f_out.write("DEPTH = {};\n".format(depth))
        f_out.write("ADDRESS_RADIX = HEX;\n")
        f_out.write("DATA_RADIX = BIN;\n\n")
        f_out.write("CONTENT BEGIN\n")

        current_line_number = 0

        for value in audio_array:
            hex_address = format(current_line_number, '02X')
            f_out.write("{} : {};\n".format(hex_address, value))
            current_line_number += 1

        for value in b_array:
            hex_address = format(current_line_number, '02X')
            f_out.write("{} : {};\n".format(hex_address, value))
            current_line_number += 1

        f_out.write("END;")
