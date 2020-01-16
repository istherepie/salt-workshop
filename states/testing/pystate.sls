#!py

import requests
def get_content():
    query = requests.get("https://jsonplaceholder.typicode.com/posts")

    if query.status_code != 200:
        raise ConnectionError("Awwww")

    data = query.json()

    # First post
    first_post = data[2]

    # Get body content
    body = first_post["body"]

    return body




def generate_params():
    return [
        {
            "name": "/tmp/another_test_file.txt"
        },
        {
            "source": "salt://testing/templates/another_testfile.j2"
        },
        {
            "template": "jinja"
        },
        {
            "user": "root"
        },
        {
            "group": "root"
        },
        {
            "mode": 644
        }
    ]

def run():

    defaults = {
        "defaults": {
            "content": get_content()
        }
    }

    state = {}

    file_params = generate_params()

    file_params.append(defaults)

    print("TESTING")

    state["This is the state id"] = {
        "file.managed": file_params
    }

    return state