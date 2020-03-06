import os
import subprocess

def get_png_files():
    filelist=os.listdir('PNG')
    for fichier in filelist[:]: # filelist[:] makes a copy of filelist.
        if not(fichier.endswith(".png")):
            filelist.remove(fichier)
    return filelist

def pngquant_args(file):
    outFile = "\"./PNGQUANT/" + file + "\""
    args = "pngquant.exe --quality=65-80 \"PNG/" + file + "\" -o " + outFile
    return args

def optipng_args(file):
    args = "optipng.exe -o1 -dir OptiPNG \"PNG/" + file + "\""
    return args

def proccess_files(conversion_name, conversion_function):
    filelist = get_png_files()
    for file in filelist:
        print(conversion_name + " converting: " + str(file))
        FNULL = open(os.devnull, 'w')
        subprocess.call(conversion_function(file), stdout=FNULL, stderr=FNULL, shell=False)


proccess_files("pngquant", pngquant_args)
proccess_files("optipng", optipng_args)

print("")
print("Done!")
g = input("Press ENTER to continue...")
