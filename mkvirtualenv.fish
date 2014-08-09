function mkvirtualenv
	vf new --system-site-packages $argv; and vf connect $argv; and vf activate $argv
end
