import json
import sys

def reading_json_file(relative_path="."):
    f = open(relative_path)
    data = json.load(f)
    return data

def writing_json_file(dictionary, relative_path="."):
    json_object = json.dumps(dictionary, indent=4)
    with open(relative_path, "w") as outfile:
        outfile.write(json_object)
    return True

def main(name):
    relative_path = "packages-zip/dataset-metadata.json"
    dataset = reading_json_file(relative_path)
    dataset["title"] = name
    dataset["id"] = f"anielvillegas/{name}"
    writing_json_file(dataset, relative_path)
    return True

if __name__=="__main__":
    name = sys.argv[1]
    main(name)
