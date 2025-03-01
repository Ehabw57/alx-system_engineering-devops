#!/usr/bin/python3
""" Gather data from an API """
if __name__ == "__main__":
    import csv
    import requests
    from sys import argv

    if not argv[1].isdigit():
        exit()

    userid = argv[1]
    url = "https://jsonplaceholder.typicode.com/"
    response = requests.get(f"{url}users/{userid}").json()
    name = response.get("username")
    response = requests.get(f"{url}todos", params={"userId": userid}).json()

    with open(f'{argv[1]}.csv', 'w') as Csvfile:
        writer = csv.writer(Csvfile, quoting=1)
        for task in response:
            writer.writerow([argv[1], name, task["completed"], task["title"]])
