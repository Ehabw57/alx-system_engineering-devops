#!/usr/bin/python3
""" Gather data from an API """
if __name__ == "__main__":
    import requests
    from sys import argv

    if not argv[1].isdigit():
        exit()

    userid = argv[1]
    url = "https://jsonplaceholder.typicode.com/"
    response = requests.get(f"{url}users/{userid}").json()
    name = response.get("name")
    response = requests.get(f"{url}todos", params={"userId": userid}).json()
    complet = ["\t " + task["title"] for task in response if task["completed"]]
    print("Employee {} is done with tasks({}/{}):\n"
          .format(name, len(complet), len(response)) + "\n".join(complet))
