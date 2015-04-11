cd()
{
    builtin cd $@; ls
}

extract()
{
    if [ -f "$1" ]; then
        case "$1" in
            *.7z      ) 7z x            "$1" ;;
            *.exe     ) cabextract      "$1" ;;
            *.tar.bz2 ) tar        xvjf "$1" ;;
            *.bz2     ) bunzip2         "$1" ;;
            *.tar.gz  ) tar        xvzf "$1" ;;
            *.gz      ) gunzip          "$1" ;;
            *.tar.xz  ) tar        xvJf "$1" ;;
            *.xz      ) unxz            "$1" ;;
            *.tar     ) tar        xvf  "$1" ;;
            *.tbz2    ) tar        xvjf "$1" ;;
            *.tgz     ) tar        xvzf "$1" ;;
            *.txz     ) tar        xvJf "$1" ;;
            *.rar     ) unrar      x    "$1" ;;
            *.zip     ) unzip           "$1" ;;
            *.Z       ) uncompress      "$1" ;;
            *         ) echo "\`$1': unrecognized file compression" ;;
        esac
    else
        echo "\`$1' is not a regular file"
    fi
}

printout()
{
    if [ -f "$1" ]; then
        case "$1" in
            *.pdf ) lpr -P ${PRINTER} -o outputorder=reverse "$1" ;;
            *.ps  ) lpr -P ${PRINTER} -o outputorder=reverse "$1" ;;
            *     ) lpr -P ${PRINTER} -o outputorder=reverse -o page-left=72 -o page-right=72 -o page-top=72 -o page-bottom=72 "$1" ;;
        esac
    else
        echo "\`$1' is not a regular file"
    fi
}

math()
{
    echo "$[${@}]"
}

shrink-pdf()
{
    mv "${1}" "${1}.orig"
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="${1}" "${1}.orig"
}
