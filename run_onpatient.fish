function run_onpatient
    dns.start
    nginx.start
    redis.start
	manage runserver_plus 0.0.0.0:8001 $argv
end
