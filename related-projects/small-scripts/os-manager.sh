#!/usr/bin/env bash

# Check if an argument is provided
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <command>"
  exit 1
fi

# Assign the first argument to a variable
command=$1

# Execute different commands based on the argument
case "$command" in
  switch)
    cd /maindata/project/nix_config/my_own_nix_config
    nixos-rebuild switch --flake .
    cd -
    ;;
  ls)
    nix profile history --profile /nix/var/nix/profiles/system
    ;;
  rm)
    nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than $2
    ;;
  gc)
    nix-collect-garbage
    ;;
  -h | --help)
    bold=$(tput bold)
    green=$(tput setaf 2) # 2 is the color code for green
    reset=$(tput sgr0)
    echo "$bold $green $0"
    commands=$(cat <<-END
    switch - build and switch to the new config in my config flake;\
    ls - list system generations;\
    rm - remove system generation older then SECOND ARGUMENT (eg.: 14d);\
    gc - runs garbage collection on the system packages;\
    \-\-help - write these instructions
END
    )

    IFS=';'
    for i in $commands; do
        IFS='-' read command explanation <<< "${i}"
        echo -e "\t${bold}${green}${command} ${reset} \t- ${explanation}"
    done
    ;;
  *)
    echo "Unknown command: $command"
    echo "Use -h for available commands"
    exit 255
    ;;
esac
