function stagedb
	ssh -A -t -v -l squash drstaff -L 3307:localhost:3307 "ssh -A -t -l squash stagedb -L 3307:10.210.96.107:3306"
end
