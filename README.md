# Secure Password Generator

A simple and secure password generator script written in Bash, capable of generating complex passwords with a mixture of uppercase letters, lowercase letters, numeric digits, and special characters.

## Features

- **Customizable Length**: Generate a password of your desired length.
- **Complexity Ensured**: Every generated password includes at least one uppercase letter, one lowercase letter, one digit, and one special character.
- **Random and Secure**: Utilizes `/dev/urandom` for random number generation.

## Requirements

- Linux operating system with Bash shell
- Core utilities such as `tr`, `head`, `shuf`, and `fold`

## Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/OWLsec-community/secure-password-generator.git
   cd secure-password-generator
