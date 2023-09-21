import json
import requests
import os

def main():
    API_TOKEN = os.environ["HFTOKEN"]
    API_URL = "https://api-inference.huggingface.co/models/gpt2"
    headers = {"Authorization": f"Bearer {API_TOKEN}"}
    def query(payload):
        data = json.dumps(payload)
        response = requests.request("POST", API_URL, headers=headers, data=data)
        return json.loads(response.content.decode("utf-8"))
    data = query("what is the day before friday?")
    print(data)
    return data

if __name__=="__main__":
    response = main()
    