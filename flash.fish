function flash --description 'Flash the keyboard lights twice briefly.'
    set pre (/Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness)

    /Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness 1
    sleep 0.15
    /Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness 0
    sleep 0.15
    /Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness 1
    sleep 0.15
    /Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness 0
    sleep 0.15
    /Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness 1
    sleep 0.15
    /Users/squash/Documents/Code/mac-keyboard-brightness/kbrightness $pre
end
