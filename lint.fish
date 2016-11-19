function lint
	g
    flake8 | pygmentize -l python
end
