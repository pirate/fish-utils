function secure.stop
    sudo zfs unmount SDCard/Secure
    sudo zfs unload-key SDCard/Secure
end
