declare -A user_info
user_info[name]="Nikunj Soni"
user_info[role]="DevOps Trainer"

echo "User : ${user_info[name]}, Role: ${user_info[role]}"

for key in  "${!user_info[@]}"; do
	echo "$key:${user_info[$key]}"
done
