#!/bin/bash

install() {

	if command -v apt &> /dev/null; then
	  sudo apt update
	  sudo apt install -y bc
	
	elif command -v dnf &> /dev/null; then
	  sudo dnf install -y bc

	elif command -v yum &> /dev/null; then
	  sudo yum install -y bc

	elif command -v pacman &> /dev/null; then
	  sudo pacman -S bc

	else	
	  wget https://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz
	  tar -xvzf bc-1.07.1.tar.gz
	  cd bc-1.07.1
	  ./configure
	  make
	  sudo make install
	fi
}

if ! command -v bc &> /dev/null; then
	echo "bc is not installed, installing bc..."
	install
fi
