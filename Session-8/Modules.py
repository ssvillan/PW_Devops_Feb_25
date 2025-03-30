import os 

print(os.listdir("."))

with open("test_file.txt","w") as f:
        f.write("This is a test file.")
        
os.remove("test_file.txt")
print("File is Removed!")

