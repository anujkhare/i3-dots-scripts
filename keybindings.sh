#!/bin/zsh

# TODO: get colored output!
RED='\033[0;31m'

cat ~/.i3/config | grep $mod+ | sed -e 's/#./s/g' | grep "\<bindsym\>" | sed -e 's/bindsym //g' | sed -e 's/$mod/Super/g' | tee >(grep "Super+[S]") | grep "Super+[^S]"
