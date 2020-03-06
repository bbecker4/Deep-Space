import os
filelist=os.listdir('PNG')
for fichier in filelist[:]: # filelist[:] makes a copy of filelist.
    if not(fichier.endswith(".png")):
        filelist.remove(fichier)

import subprocess
for file in filelist:
    print("pngquant converting: " + str(file))
    outFile = "\"./PNGQUANT/" + file + "\""
    FNULL = open(os.devnull, 'w')    #use this if you want to suppress output to stdout from the subprocess
    args = "pngquant.exe --quality=65-80 \"PNG/" + file + "\" -o " + outFile
    subprocess.call(args, stdout=FNULL, stderr=FNULL, shell=False)


for file in filelist:
    print("OptiPNG converting: " + str(file))
    FNULL = open(os.devnull, 'w')    #use this if you want to suppress output to stdout from the subprocess
    args = "optipng.exe -o1 -dir OptiPNG \"PNG/" + file + "\""
    subprocess.call(args, stdout=FNULL, stderr=FNULL, shell=False)

print("")
print("Done!")
g = input("Press ENTER to continue...")
