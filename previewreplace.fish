function previewreplace
    set find "$argv[1]"
    set replace "$argv[2]"
	faketty ag -s "$find" | regex "s/$find/$replace/gm"
end
