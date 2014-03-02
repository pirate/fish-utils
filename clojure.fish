function clojure
	if test $argv
    ant $argv
else
    java -cp /usr/local/Cellar/clojure/1.5.1/clojure-*.jar clojure.main
end
end
