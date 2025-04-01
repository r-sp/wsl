# SSH Connection

Generate new ssh key
```sh
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519
```

Start ssh-agent in the background
```sh
eval "$(ssh-agent -s)"
```

Add your ssh private key to the ssh-agent 
```sh
ssh-add ~/.ssh/id_ed25519
```

Reassign your existing ssh key
```sh
# ~/.ssh/config
Host github.com
    Hostname ssh.github.com
    Port 443
    User git
    IdentityFile ~/.ssh/id_ed25519
    UserKnownHostsFile ~/.ssh/known_hosts
```

See:
- [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [About commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)
- [Telling Git about your signing key](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)
- [SSH config file for OpenSSH client](https://www.ssh.com/academy/ssh/config)
- [Identity Key in SSH](https://www.ssh.com/academy/ssh/identity-key)