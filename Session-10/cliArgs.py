import sys
import argparse

#1. reading arguments
name=sys.argv[1] # first argument passed
print(f"Hello {name} !")

#2 using argparse for advance argument parsing

parser=argparse.ArgumentParser(description="Greet the user")
parser.add_argument("name",help="Your Name")
parser.add_argument("--age",type=int,help="Your Age",default=0)

args=parser.parse_args()

print(f"Hello {args.name}, age {args.age}!")

#type in cli=> python script.py Nikunj --age 56 


