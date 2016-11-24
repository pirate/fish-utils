function loginitems
	defaults read com.apple.loginitems | grep 'Name = ' | regex 's/^\s+Name = "(.+)";$/$1/mg'
end
