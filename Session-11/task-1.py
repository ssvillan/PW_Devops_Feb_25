#install requests---> pip install requests
#install beautifulsoup----> pip install beaustifulsoup4

import requests
from bs4 import BeautifulSoup

#define URL
url="https://www.google.com/"

#send a GET Request and Parse content
response=requests.get(url)
soup= BeautifulSoup(response.text,"html.parser")

# extrcat and print the page title
print("Page Title:",soup.title.text)

# extract and print all links
print("\n Links:") 
for link in soup.find_all("a"):
    print(link.get("href"))


# extract and print all images source
print("\n Images:")
for img in soup.find_all("img"):
    print(img.get("src"))