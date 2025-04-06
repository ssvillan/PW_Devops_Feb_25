import re

text="User's email is nikunj@gmail.com"

match=re.search(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z.-]{2,}",text)
if match:
    print("Email Found:",match.group())