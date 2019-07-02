function shortcut_app
	set dir (find_file $argv[1] /Applications/Categories)
set app (find_app $argv[2])
set base (basename "$app")
ln -s "$app" "/Applications/Categories/$dir/$base"
and echo "[√] Linked $app to /Applications/Categories/$dir/$base"
or return 1
end
