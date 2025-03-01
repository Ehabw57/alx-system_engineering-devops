#!/usr/bin/python3
""" Gather data from an API """
if __name__ == "__main__":
    import json
    import requests

    url = "https://jsonplaceholder.typicode.com"
    all_tasks = requests.get(f"{url}/todos").json()
    data = {}
    users = requests.get(f"{url}/users").json()
    for task in all_tasks:
        userId = str(task['userId'])
        name = (users[int(userId) - 1])['username']
        if not data.get(userId):
            data[userId] = []
        data[userId].append({
            "task": task["title"],
            "completed": task["completed"],
            "username": name})

    with open('todo_all_employees.json', 'w') as JsonFile:
        dumped = json.dumps(data)
        JsonFile.write(dumped)
