if [ ! -z "${SSH_CONNECTION}" ]; then
    remote_host="${HOST}:"
fi

if [ ${UID} = 0 ]; then
    usercolor="red"
else
    usercolor="blue"
fi

PROMPT="%{$fg_no_bold[${usercolor}]%}[${remote_host}%d] >>> %{$reset_color%}"
