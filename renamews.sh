#!/bin/bash

OLD=$(i3-msg -t 'get_workspaces' | sed -e 's/{"num/\n{"num/g' | grep '"focused":true' | sed -e 's/,/\n/g' | grep "name" | cut -d \" -f 4)

NUM=$(echo $OLD | cut -d : -f 1)
OLD=$(echo $OLD | cut -d : -f 2)
#echo $NUM:$OLD

NEW=$(zenity --text="Enter new name:" --entry --title="Rename workspace $NUM" --entry-text="$OLD")
#echo "$NUM:$NEW"

cat ~/.i3/config | sed -e "s/workspace $NUM:$OLD/workspace $NUM:$NEW/g" > temp
rm ~/.i3/config
mv temp ~/.i3/config
i3-msg "rename workspace $NUM:$OLD to $NUM:$NEW"
i3-msg 'reload' # will change the workspace name internally
