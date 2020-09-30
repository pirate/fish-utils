function sudotouch --description 'enable sudo authentication with touchid fingerprint'
	/usr/bin/sudo bash -c 'cat /Users/squash/dotfiles/etc_pam.d_sudo > /etc/pam.d/sudo'
end
