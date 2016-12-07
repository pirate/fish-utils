function blueplease --description 'Bluetooth please stop stuttering for fucks sake.'
    sudo renice -5 (pid blued)
    sudo renice -5 (pid coreaudiod)
    sudo renice -5 (pid bluetoothaudio)
    sudo renice -5 (pid iTunes)
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 53
end
