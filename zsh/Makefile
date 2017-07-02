VAR1="VAR1"
VAR2="VAR2"

all: test dirs
	echo "Finished executing test & dirs"

test:
	echo "Test rule 1"

dirs:
	[ -d $(HOME)/asdfzsdf ] || echo "creating dir $(VAR1) & $(VAR2) in bash var $(HOME)"
	[ -d $HOME/.ssh ] || echo "Creating .ssh"
	
