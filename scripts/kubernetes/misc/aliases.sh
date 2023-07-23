home=
if [ -n "$1" ]; then
    home=$1
else
    home=$HOME
fi

rcs=( "$home/.bashrc" "$home/.zshrc" )
for rc in ${rcs[@]}; do
    echo "alias k='kubectl'" >> $rc
done
