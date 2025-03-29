#!/bin/bash
read -p "Enter an Email": email

if [[ $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then 
	echo "Valid Email"
else
	echo "Invalid Email"
fi
