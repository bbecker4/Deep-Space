import os
import subprocess

def get_png_files():

    f = open("processed.txt", "r")
    processed = []
    for line in f:
        processed.append(line.strip())

    filelist=os.listdir('PNG')
    for file in filelist[:]:
        if not(file.endswith(".png")):
            filelist.remove(file)
        elif file in processed:
            filelist.remove(file)
    return filelist

def write_files_to_processed(files):
    f = open("processed.txt", "a")
    for file in files:
        f.write(file + "\n")

def pngquant_args(file):
    outFile = "\"./PNGQUANT/" + file + "\""
    args = "pngquant.exe --quality=65-80 \"PNG/" + file + "\" -o " + outFile
    return args

def optipng_args(file):
    args = "optipng.exe -o1 -dir OptiPNG \"PNG/" + file + "\""
    return args

def pvrtextool_args(file):
    args = "PVRTexToolCLI.exe -i \"PNG/" + file + "\"" + " -o \"PVR/" + file[:file.index('.')] + ".pvr\" -f PVRTC1_2 -q pvrtcfast"
    return args

def proccess_files(conversion_name, conversion_function, files):
    for file in files:
        print(conversion_name + " converting: " + str(file))
        FNULL = open(os.devnull, 'w')
        subprocess.call(conversion_function(file), stdout=FNULL, stderr=FNULL, shell=False)



files = get_png_files()
proccess_files("pngquant", pngquant_args, files)
proccess_files("optipng", optipng_args, files)
proccess_files("pvrtextool", pvrtextool_args, files)
write_files_to_processed(files)

print("")
print("Done!")
g = input("Press ENTER to continue...")
