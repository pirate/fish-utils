function blueplease --description 'Bluetooth please stop stuttering for fucks sake.'
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
    defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
    defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
    defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
    defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
    defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80
    k --all bluetoothd
    k --all bluetoothaudiod
    k --all coreaudio
    sleep 3
    sudo renice -5 (pid bluetoothd)
    sudo renice -5 (pid bluetoothaudiod)
    sudo renice -5 (pid Music)
    sudo renice -5 (pid coreaudiod)
end
