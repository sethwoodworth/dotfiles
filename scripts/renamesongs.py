import os

for file in os.listdir('./'):
    file_string = str(file)
    if file_string[1] == ' ':
        filled_name = '0' + file_string
        print filled_name
        os.rename(file, filled_name)
        print "Renamed " + file + " to " + filled_name + "."
    else:
        print file + " looks ok to me."
