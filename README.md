## Installation

1. Clone to `~/dotfiles`
2. For most directories, while in the `~/dotfiles`:
    ```
    stow emacs
    stow git
    stow i3
    stow linux-hacks
    stow nitrogen
    stow zsh
    ```
4. For the `system` directory, copy all the files over:
    ```
    sudo cp -R ~/dotfiles/system/* ~/temp/stow-test
    ```
