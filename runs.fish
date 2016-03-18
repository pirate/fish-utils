function runs
	fork "sleep 5; open http://drchrono.l"
    manage runserver_plus 0.0.0.0:8000 $argv
end
