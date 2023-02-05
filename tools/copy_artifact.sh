if [ -f $1 ]; then
    cp $1 $2
else
    printf "\033[93m ⚠️ No such file \"$1\". Artifact won't be copied!\033[0m\n"
fi
