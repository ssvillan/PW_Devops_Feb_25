from datetime import datetime

#1. using strftime     f=formatting
now=datetime.now()
formatted=now.strftime("%Y-%m-%d %H-%M-%S")
print(" Date:",now)
print("Formatted Date:",formatted)

#2. using strptime p=parsing to convert the string formate into datetime format

date_str="2025-04-06 16:19:50"
parsed=datetime.strptime(date_str,"%Y-%m-%d %H:%M:%S")
print("Parsed datetime object:",parsed)