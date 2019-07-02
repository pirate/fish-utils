function active_interface
	route get 1.1.1.1 | grep interface: | awk '{print $2}'
end
