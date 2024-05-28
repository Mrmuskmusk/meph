#!/bin/bash

get_vm_ip() {
  vm_ip=$(hostname -I | awk '{print $1}')
  if [[ -z "$vm_ip" ]]; then
    echo "Error: Could not determine VM IP address."
    exit 1
  fi
  echo "$vm_ip"
}

# Call the function to get the IP address
vm_ip=$(get_vm_ip)

# Check if IP retrieval was successful
if [[ -z "$vm_ip" ]]; then
  echo "Error: Could not determine VM IP address."
  exit 1
fi

# Use the IP address (replace with your desired action)
echo "VM IP address: $vm_ip"

# You can perform other actions using the IP address here
