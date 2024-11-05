
import requests
weather = requests.get("https://wttr.in/?format=j1").json()
print(weather)
