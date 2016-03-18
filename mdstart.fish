function mdstart --description description
	dns.start
    postgresql.start
    nginx.start
    django.start $argv
end
