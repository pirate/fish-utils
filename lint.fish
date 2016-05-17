function lint
	cd ~/mavrx/FOCS
make lint | grep -v node_modules
end
