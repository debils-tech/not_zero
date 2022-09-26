#!/bin/bash

MAIN_MENU_OPTION_CONFIG="Initial config"
MAIN_MENU_OPTION_GEN="Generate code"
MAIN_MENU_OPTION_FORMAT="Format code"
MAIN_MENU_OPTION_TEST="Run code tests"

MAIN_MENU=$(gum choose "$MAIN_MENU_OPTION_GEN" "$MAIN_MENU_OPTION_FORMAT" "$MAIN_MENU_OPTION_TEST" "$MAIN_MENU_OPTION_CONFIG")

if [[ "$MAIN_MENU" == "$MAIN_MENU_OPTION_CONFIG" ]]
then
    make config
elif [[ "$MAIN_MENU" == "$MAIN_MENU_OPTION_GEN" ]]
then
    make gen
elif [[ "$MAIN_MENU" == "$MAIN_MENU_OPTION_FORMAT" ]]
then
    make format
elif [[ "$MAIN_MENU" == "$MAIN_MENU_OPTION_TEST" ]]
then
    make test
fi
