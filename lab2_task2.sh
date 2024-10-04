#!/bin/bash

letter_writer() {
  cat > /home/$username/welcome.txt <<EOL
Dear $first_name,
Welcome to Initech Corporation! We’re so happy to have you in the $dept_name Department as a $job_title. Please don’t forget to complete your TPS Reports in a timely manner.
Sincerely,
Bill Lumbergh
EOL
}

file_system_writer() {
  mkdir /home/$username/Desktop
  mkdir /home/$username/Documents
  mkdir /home/$username/Downloads
  mkdir /home/$username/Pictures
  cp /path/to/ackbar.png /home/$username/Pictures/
}

permission_editor() {
  chown -R $username:$username /home/$username
  chmod 444 /home/$username/welcome.txt
}

while true; do
  read -p "Username: " username
  read -p "Full Name: " first_name last_name
  read -p "Department: " dept_name
  read -p "Job Title: " job_title
  
  #create user and home directory
  sudo useradd $username
  sudo mkdir /home/$username
  sudo chown $username:$username /home/$username

  file_system_writer
  letter_writer
  permission_editor

  echo "User $username added!"
  
  read -p "Would you like to add another user? (y/n): " response
  if [ "$response" != "y" ]; then
    break
  fi
done
