# About

This reposity contains a lightweight vim configuration file, ```.vimrc``` which makes your vim more friendly and smart.
It enable the most of basic functions and help you to install some useful Plugins.

It uses [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim) to manage vim plugins. 
## Puglins contained
- [NLKNguyen/papercolor-theme]()
- [vim-airline/vim-airline]()
- [vim-airline/vim-airline-themes]()
- [powerline/powerline-fonts]()
- [scrooloose/nerdtree]()
- [ggdroot/indentLine]()
- [ycm-core/YouCompleteMe]()
- [artur-shaik/vim-javacomplete2]()
- [davidhalter/jedi-vim]()

# Quick Start

Put ```.vimrc``` file in the user's home directory ```~/```

# Install Plugins by Vundle
## Install Vundle Plugins
1. Set up Vundle  ```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```
2. Use command ```:PluginInstall``` in vim to install Plugins.
3. Compile ```YouCompleteMe```. Open the directory ```cd ~/.vim/bundle/YouCompleteMe```. Run ```python3 install.py --all```.
See the [installation guide](https://github.com/ycm-core/YouCompleteMe#installation) for more instructions.
(All the other Plugins have been Installed by Step 2.)



See [the guide of Vundle](https://github.com/VundleVim/Vundle.vim#quick-start) for advanced configuration.