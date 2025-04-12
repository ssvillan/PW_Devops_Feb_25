import requests
url="https://httpbin.org/get"
response=requests.get(url)

#check the response code
if response.status_code == 200: 

    print(response.status_code)
    #print(response.json())
    print(response.text[:500])
else :
    print(f"Failed to fetch the page, Status Code: {response.status_code}")