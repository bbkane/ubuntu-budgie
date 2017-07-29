#!/bin/bash

# exit the script on command errors or unset variables
set -eu

# https://stackoverflow.com/a/2990533/2958070
echoerr() { printf "%s\n" "$*" >&2; }

# https://stackoverflow.com/a/246128/295807
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${script_dir}"

# https://unix.stackexchange.com/a/122848/185953
action="${1:-run}"
verbosity="${2:-vv}"

if [[ "${action}" == "help" ]]; then
    echo "Usage: $0 [run|help|ping] [verbosity]"
    echo "Example: $0 run vvvv"
    exit
elif [[ "${action}" == "ping" ]]; then
    ansible -i hosts -m ping all
elif [[ "${action}" == "run" ]]; then
    ansible-playbook -i hosts -K "-${verbosity}" playbook.yaml
else
    echoerr "Unrecognized action: '$action'"
    exit 1
fi
