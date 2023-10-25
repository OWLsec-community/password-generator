#!/bin/bash

# Function to generate a random password
generate_password() {
    local length=$1

    # Defining the character sets
    local upper_chars="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local lower_chars="abcdefghijklmnopqrstuvwxyz"
    local digits="0123456789"
    local special_chars="!@#$%^&*()-_=+[]{}|;:,.<>?/~"
    
    # Ensure at least one character from each set
    local password=$(< /dev/urandom tr -dc "$upper_chars" | head -c1)
    password+=$(< /dev/urandom tr -dc "$lower_chars" | head -c1)
    password+=$(< /dev/urandom tr -dc "$digits" | head -c1)
    password+=$(< /dev/urandom tr -dc "$special_chars" | head -c1)
    
    # Fill the rest of the password length with random characters from all sets
    local all_chars="$upper_chars$lower_chars$digits$special_chars"
    for (( i=${#password}; i<length; i++ )); do
        password+=$(< /dev/urandom tr -dc "$all_chars" | head -c1)
    done
    
    # Shuffle the password to randomize the order of characters
    echo $password | fold -w1 | shuf | tr -d '\n'
}

# Ensure at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <password_length>"
    exit 1
fi

# Ensure the password length is at least 16
password_length=$1
if [ $password_length -lt 16 ]; then
    echo "Password length should be at least 16. Setting length to 16."
    password_length=16
fi

# Generate and print the password
password=$(generate_password $password_length)
echo "Generated Password: $password"
