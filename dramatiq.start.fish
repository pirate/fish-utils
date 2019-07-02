function dramatiq.start --description 'description'
    echo $green"[+] Starting Dramatiq..."$normal
    psax dramatiq | grep -v "fish -c"; and return;
    fork "g; manage rundramatiq --processes 1 --threads 1"
    sleep 1
    psax dramatiq | grep -v "fish -c"
end
