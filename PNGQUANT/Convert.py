import os
filelist=os.listdir('PNG')
for fichier in filelist[:]: # filelist[:] makes a copy of filelist.
    if not(fichier.endswith(".png")):
        filelist.remove(fichier)

import subprocess
for file in filelist:
    print("Converting " + str(file))
    FNULL = open(os.devnull, 'w')    #use this if you want to suppress output to stdout from the subprocess
    args = "pngquant.exe --quality=65-80 \"PNG/" + file + "\""
    subprocess.call(args, stdout=FNULL, stderr=FNULL, shell=False)

print("Done!")
g = raw_input("Press ENTER to continue...")
