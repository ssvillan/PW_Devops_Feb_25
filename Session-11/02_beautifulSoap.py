from bs4 import BeautifulSoup
#html='<html><body><h1>Welcome to PW SKILLS</h1></body></html>'
#soup=BeautifulSoup(html,'html.parser')
#print(soup.h1.text)
html2="""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Python Program</title>
</head>
<body>
    <h1>PW SKILLS</h1>
    <p class="info">Web Automation.</p>
    
</body>
</html>
"""
# create a beautiful soap object
soup=BeautifulSoup(html2,"html.parser")

#exctract element
print("Title:",soup.title.text)
print("Headings:",soup.h1.text)
print("Paragraph:",soup.find("p",class_="info").text)