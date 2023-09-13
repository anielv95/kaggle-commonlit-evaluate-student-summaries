import os
from zipfile import ZipFile

def main():

    dirName = "packages/"
    zipName = "packages-zip/packages.zip"

    # Create a ZipFile Object
    with ZipFile(zipName, 'w') as zipObj:
        # Iterate over all the files in directory
        for folderName, subfolders, filenames in os.walk(dirName):
            for filename in filenames:
                if (filename not in zipName):
                    print(filename)
                    # create complete filepath of file in directory
                    filePath = os.path.join(folderName, filename)
                    # Add file to zip
                    zipObj.write(filePath)
    return True

if __name__=="__main__":
    main()