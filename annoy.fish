function annoy
	cat /dev/urandom | hexdump -v -e '/1 "%u\n"' | awk '{ split("0,2,4,5,7,9,11,12",a,","); for (i = 0; i < 1; i+= 0.0001) printf("%08X\n", 100*sin(1382*exp((a[$1 % 8]/12)*log(2))*i)) }' | xxd -r -p | sox -traw -r44100 -b16 -e unsigned-integer - -tcoreaudio &
    while true
        /Users/squash/Documents/Code/mac-keyboard-brightness/dbrightness 0
        /Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness 1
        sleep 0.2
        /Users/squash/Documents/Code/mac-keyboard-brightness/dbrightness 1
        /Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness 0
        sleep 0.2
    end
end
