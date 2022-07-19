#!/bin/bash
# Cleanup Scripts
# run chmod +x cleanup.sh
# AlfanCodes
#
# Flutter Cleanup : search pubspec.yaml file on all flutter projects directory and run flutter clean
# Node Modules : search packages.json file on all projects directory and run rm -fr node_modules

PS3='Enter your choice: '
options=("Flutter Cleanup" "Node Modules Cleanup" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Flutter Cleanup")
            echo ""
            echo "Flutter Clean Recursive ( by AlfanCodes )"
            echo "Looking for projects... ( it may take a while )"
            find . -name "pubspec.yaml" -exec $SHELL -c '
                echo "Done. Cleaning all projects."
                for i in "$@" ; do
                    DIR=$(dirname "${i}")
                    echo "Cleaning ${DIR}..."
                    (cd "$DIR" && flutter clean >/dev/null 2>&1)
                done
                echo "DONE!"
                echo ""
            ' {} +
            break
            ;;
        "Node Modules Cleanup")
            echo ""
            echo "Node Modules Recursive ( by AlfanCodes )"
            echo "Looking for projects... ( may take a while )"
            find . -name "package.json" -exec $SHELL -c '
                echo "Done. Cleaning all projects."
                for i in "$@" ; do
                    DIR=$(dirname "${i}")
                    echo "Cleaning ${DIR}..."
                    (cd "$DIR" && rm -fr node_modules >/dev/null 2>&1)
                done
                echo "DONE!"
                echo ""
            ' {} +
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done