if [ ${UID} = 0 ]; then
    usercolor_primary="red"
    usercolor_accent="yellow"
else
    usercolor_primary="blue"
    usercolor_accent="magenta"
fi

PROMPT="%{$fg_no_bold[${usercolor_primary}]%}[%{$fg_no_bold[${usercolor_accent}]%}${HOST}:%d%{$fg_no_bold[${usercolor_primary}]%}] >>> %{$reset_color%}"
