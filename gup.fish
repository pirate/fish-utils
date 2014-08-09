function gup
	gru
gch dev
gp
gch $argv
grb dev
if test $argv
gpush --force $argv
end
end
