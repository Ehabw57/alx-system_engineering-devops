#!/usr/bin/python3
""" Gather data from an API """
if __name__ == "__main__":
    import json
    import requests
    from sys import argv

    if not argv[1].isdigit():
        exit()

    userid = argv[1]
    url = "https://jsonplaceholder.typicode.com/"
    response = requests.get(f"{url}users/{userid}").json()
    name = response.get("username")
    response = requests.get(f"{url}todos", params={"userId": userid}).json()
    data = {}
    data[str(argv[1])] = []
    for task in response:
        data[str(argv[1])].append({
            "task": task["title"],
            "completed": task["completed"],
            "username": name})

    with open(f'{argv[1]}.json', 'w') as JsonFile:
        dumped = json.dumps(data)
        JsonFile.write(dumped)
