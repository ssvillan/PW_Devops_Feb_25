#!/bin/bash

echo "Checking for Internet Connection....."

until ping -c 1 google.com &>/dev/null; do
    echo "No internet , retrying in 5 seconds..."
    sleep 5
done 
echo "Internet is Available!"
