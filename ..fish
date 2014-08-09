function . --description 'Evaluate contents of file (deprecated, see "source")' --no-scope-shadowing
	if begin
			test (count $argv) -eq 0
			# Uses tty directly, as isatty depends on "."
			and tty 0>&0 >/dev/null
		end
		echo "source: '.' command is deprecated, and doesn't work with STDIN anymore. Did you mean 'source' or './'?" >&2
		return 1
	else
		source $argv
	end
end
