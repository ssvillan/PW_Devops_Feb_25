import os
import shutil

path="D:\\" if os.name =="nt" else "/mnt/d"


total,used,free= shutil.disk_usage(path)
def to_gb(bytes_value):
    return bytes_value // (1024**3) 


# printing the value
print(f"OS Name:${os.name}")
print(f"Checking disk usage for:{path}")
print("Total:",to_gb(total),"GB")
print("Used:",to_gb(used),"GB")
print("Free:",to_gb(free),"GB")