# import required module
import os
import shutil
# assign directory
rootdir = '/Users/p.zaniewski/dev/learning-cloud/'

for root, dirs, files in os.walk(rootdir):
    for dir in dirs:
        if dir == ".git":
            print("Removing: " + os.path.join(root, dir))
            shutil.rmtree(os.path.join(root, dir))
