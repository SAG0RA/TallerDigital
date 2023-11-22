from PIL import Image
import re

def read_dat_file(file_path):
    data = {}
    with open(file_path, 'r') as file:
        content_started = False
        for line in file:
            if "-- begin_signature" in line:
                content_started = True
                continue
            elif "-- end_signature" in line:
                content_started = False
                continue
            elif content_started and line.strip():
                address, binary_data = re.match(r'\s*(\d+)\s+:\s+([01]+);', line).groups()
                data[int(address)] = binary_data
    return data

def reconstruct_image(data, width, height):
    image = Image.new("1", (width, height))  # "1" mode for 1-bit pixels, i.e., black and white

    for address, binary_data in data.items():
        x = address % width
        y = address // width
        pixel_value = int(binary_data, 2)
        image.putpixel((x, y), pixel_value)

    return image

def main():
    file_path = "tu_archivo.dat"  # Reemplaza con la ruta real de tu archivo .dat
    width = 100
    height = 100
    data = read_dat_file(file_path)
    image = reconstruct_image(data, width, height)
    image.show()

if __name__ == "__main__":
    main()