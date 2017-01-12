function it --description "alias of 'tell iTunes $argv'"
    switch (count $argv)
    case 0
        echo "-----------------------------";
        echo "iTunes Command Line Interface";
        echo "-----------------------------";
        echo "Usage: it <option>";
        echo;
        echo "Options:";
        echo " status   = Shows iTunes' status, current artist and track.";
        echo " play     = Start playing iTunes.";
        echo " pause    = Pause iTunes.";
        echo " next     = Go to the next track.";
        echo " prev     = Go to the previous track.";
        echo " mute     = Mute iTunes' volume.";
        echo " unmute   = Unmute iTunes' volume.";
        echo " vol up   = Increase iTunes' volume by 10%";
        echo " vol down = Increase iTunes' volume by 10%";
        echo " vol #    = Set iTunes' volume to # [0-100]";
        echo " stop     = Stop iTunes.";
        echo " quit     = Quit iTunes.";
    case '*'
        osascript -e 'tell application "iTunes"' -e "$argv" -e "end tell"
    end
end
