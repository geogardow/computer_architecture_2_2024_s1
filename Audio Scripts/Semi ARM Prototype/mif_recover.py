def mif_recover(path):
    start_extracting = False
    values = []

    with open(path, 'r') as file:
        for line in file:
            if 'CONTENT BEGIN' in line:
                start_extracting = True
                continue

            if start_extracting and line.strip() and not line.strip() == 'END;':
                if '..' in line:
                    address_range, value = line.split(':')
                    start_address, end_address = address_range.strip()[1:-1].split('..')
                    value = value.split(';')[0].strip()

                    for address in range(int(start_address, 16), int(end_address, 16) + 1):
                        values.append(value)
                else:
                    values.append(line.split(':')[1].split(';')[0].strip())

    return values


values_list = mif_recover("./Audio Scripts/Semi ARM Prototype/live.mif")
print(values_list)

