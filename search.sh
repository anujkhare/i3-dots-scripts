str="$(cat ~/.i3/query)";
q=${str// /%20};
echo $q; 

firefox --new-window www.google.com/search?hl=en#q=$q
