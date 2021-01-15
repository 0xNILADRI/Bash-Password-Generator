#!/bin/bash

#Password Generator
#Author: Niladri Ghosh
#Date:   16 Jan 2021

echo -e "\e[32m"
echo "*********************************************************************"
echo "                          Password Generator                         "
echo "                                                                     "
echo "====================== Created By Niladri Ghosh ====================="	                                                                  
echo "*********************************************************************"

echo -e "\e[0m"

read -p "[#] Enter the length of Password (e.g. 10): " length
read -p "[#] Enter the combinations required (e.g. 5): " combination

declare -a arr

arr+=($(	for p in $(seq 1 $combination);
	do
		openssl rand -base64 48 | cut -c1-$length
	done ))


for i in $(seq 1 $combination); 
	do 
		printf '\n%s' "[$i] ${arr[i - 1]}"
	done

printf '\n\n'
read -p "[#] Choose the desired password (e.g. 4): " password
read -p "[#] Store the password for platform (e.g. Facebook): " db_name


echo "********************************" >> password.txt
echo "$db_name" >> password.txt
echo "********************************" >> password.txt
echo "" >> password.txt
echo "${arr[password - 1]}" >> password.txt
echo "" >> password.txt

