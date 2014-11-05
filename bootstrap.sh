#!/usr/bin/env bash

# Configuration ###############################################################

CONF_FILE="${HOME}/.dotfiles.conf"

COLOR_CREATE="\033[1;32m"
COLOR_SKIP="\033[1;34m"
COLOR_DELETE="\033[1;35m"
COLOR_RESET="\033[0m"

# Script State ################################################################

script_name="`basename ${0}`"
script_dir="`cd "$(dirname "${0}")" && pwd`"

# Functions ###################################################################

install_dotfiles() {
    while (( $# )); do
        if [ ! -e "${2}" ]; then
            echo -e "${COLOR_CREATE}Creating link:${COLOR_RESET} ${2}"
            ln -s "${script_dir}/${1}" "${2}"
        else
            echo -e "${COLOR_SKIP}Skipping link:${COLOR_RESET} ${2} (file exists)"
        fi

        shift 2
    done
}

clean_dotfiles() {
    while (( $# )); do
        # only remove symbolic links
        if [ -L "${2}" ]; then
            echo -e "${COLOR_DELETE}Removing link:${COLOR_RESET} ${2}"
            rm -f "${2}"
        fi

        shift 2
    done
}

# Main Execution ##############################################################

if [ -e "${CONF_FILE}" ]; then
    . "${CONF_FILE}"
else
    echo "${script_name}: error: cannot find configuration file"
    exit 1
fi

case "${1}" in
    install )
        install_dotfiles "${DOTFILES[@]}"
        ;;
    clean )
        clean_dotfiles "${DOTFILES[@]}"
        ;;
    * )
        echo "${script_name}: error: invalid command"
        exit 1
        ;;
esac
