### to make this work:
1. clone the repo into your home directory
2. add this line to you .bashrc file:

```
source ~/dotfiles/.bashrc
```

#### Assumptions & Caveats
All of the paths in ```dotfiles/.bashrc``` were written with the assumption that dotfiles would be in HOME. you can try putting it somewhere else... I don't know what will happen though.

```.vimrc``` assumes that ```~/.vim``` is symlinked to ```~/dotfiles/.vim```. It will try to create the symlink if ```~/.vim``` doesn't exist, and it will squawk at you if it exists but isn't symlinked.
