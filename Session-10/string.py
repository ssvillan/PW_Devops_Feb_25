message=" Hello Devops World! "

#1. Remove leading and trailing spaces
print("1. strip():",message.strip())

#2. convert to uppercase
print("2. upper():",message.upper())

#3. convert to lowercase
print("3. lower():",message.lower())

#4. Replace the Word
print("4. replace():",message.replace("Devops","Python"))

#5. check if string start with a word
print("5. startswith('Hello'):",message.strip().startswith("Hello"))

#6. check if string ends with a word
print("6. endswith('World'):",message.strip().endswith("World!"))

#7. find position of substring
print("7. find('Devops'):",message.find("Devops"))

#8. count how many times a word appears
print("8. count('o'):",message.count("o"))

#9. Split the string into a list
words=message.strip().split(" ")
print("9. split():",words)

#10. join th list back into a string with "-"
print("10. join():","-".join(words))

#11.Capitalize only first letter --- error in method
print("11. capitalize():",message.strip().capitalize())

#12. check all character are alphabets
print("12. isalpha():","Hello".isalpha())

#12 check that string contains only digits
print("13. isdigit():","12345".isdigit())