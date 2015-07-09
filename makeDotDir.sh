dir=~/
yuraDir=/Users/yura
dotDir=/Users/yura/.dotfiles

files="vim vimrc zshrc oh-my-zsh viminfo tmux.conf"

echo "make directory for $dotDir"
mkdir $dotDir
echo "done..."

echo "move all dotfiles from $yuraDir to $dotDir"
for file in $files; do
    echo "moving .$file to $dotDir"
    mv $yuraDir/.$file $dotDir/.$file
    echo "create symlink in $yuraDir and $dir"
    ln -s $dotDir/.$file $yuraDir/.$file
    ln -s $dotDir/.$file $dir/.$file
done

