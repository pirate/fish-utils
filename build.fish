function build
	clear; g++ $argv.cpp -o $argv; and eval ./$argv
end
