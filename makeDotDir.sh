dir=~/
dotDir=/home/yura/.dotfiles

files="vim vimrc zshrc oh-my-zsh viminfo tmux.conf"


for file in $files; do
    ln -s $dotDir/.$file $dir/.$file
done

