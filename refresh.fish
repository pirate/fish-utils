function refresh --description 'Refresh current Chrome tab'
  osascript -e "
    tell application \"Google Chrome\"
      activate
      reload active tab of (get window 1)
    end tell"
end
