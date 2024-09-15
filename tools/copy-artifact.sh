#!/bin/bash

if [ -f $1 ]; then
    cp $1 $2
else
    echo -e "\033[93m ⚠️ No such file \"$1\". Artifact won't be copied!\033[0m"
fi
