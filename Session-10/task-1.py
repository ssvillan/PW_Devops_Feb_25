import re

pattern=r"^(?:\+91[\-\s]?|0)?[6-9]\d{9}$"

mobile_number="+915436789123"

if re.match(pattern,mobile_number):
    print(f"{mobile_number} is valid mobile number")
else:
    print(f"{mobile_number} is not a valid mobile number")

