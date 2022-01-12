# My-Vim-Config
Plug Management: [Vim Plug](https://github.com/junegunn/vim-plug)  
Vim theme: [Gruxvbox](https://github.com/morhetz/gruvbox)

## How to use it
1. ``git clone`` https://github.com/ChenYi-qy/My-Vim-Config.git
2. Replace your vim config file: ``mv ./My-Vim-Config/.vimrc ~/`` (delete your .vimrc if you have)
3. (Optional)Install Vim-Plug If your didn't have:
```
Vim (~/.vim/autoload)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
4. Install Plugins
```
vim ~/.vimrc
:PlugClean
:PlugInstall
```
5. Read and Execute .vimrc
```
source ~/.vimrc
```



## Preview
![Screen Shot 2022-01-06 at 10 24 14 AM](https://user-images.githubusercontent.com/58657543/148318127-b445176e-12cc-44bd-9fa6-f05fd96f7e08.png)
