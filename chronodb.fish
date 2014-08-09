function chronodb
	ssh -fNg -L 3307:127.0.0.1:3306 chronoplex
end
