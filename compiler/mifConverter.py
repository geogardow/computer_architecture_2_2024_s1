def convert_to_mif(input_file, output_file):
    # Read the binary data from the text file
    with open(input_file, 'r') as file:
        binary_data = file.readlines()

    # Remove leading/trailing whitespace and convert to MIF format
    mif_content = f"""WIDTH = {len(binary_data[0].strip())};\n"""
    mif_content += f"""DEPTH = {len(binary_data)};\n"""
    mif_content += "ADDRESS_RADIX = HEX;\n"
    mif_content += "DATA_RADIX = BIN;\n\n"
    mif_content += "CONTENT\nBEGIN\n"

    for address, data in enumerate(binary_data):
        mif_content += f"{address:02X} : {data.strip()};\n"

    mif_content += "END;\n"

    # Write the formatted data to the output .mif file
    with open(output_file, 'w') as file:
        file.write(mif_content)