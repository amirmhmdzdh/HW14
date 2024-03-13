#!/usr/bin/env bash

function create_file() {

  for i in {1..5}; do
    touch "file$i.txt"
  done
  echo "Successfully created 5 text files."
}
function add_text() {

  for i in {1..5}; do
    echo "Hello world" >>"file$i.txt"
  done
  echo "Successfully added 'Hello world' to the files."
}
function replace_text() {

  for i in {1..5}; do
    sed -i 's/world/bash/g' "file$i.txt"
  done
  echo "Successfully replaced 'world' with 'bash' in the files."
}

function main_menu() {

  PS3="Enter your choice: "
  options=("Create text files" "Add 'Hello world' to files" "Replace 'world' with 'bash' in files" "Exit")

  while true; do
    clear
    echo "Main Menu:"
    select option in "${options[@]}"; do
      case $REPLY in

      1)
        create_file
        break
        ;;
      2)
        add_text
        break
        ;;
      3)
        replace_text
        break
        ;;
      4)
        echo "Goodbye!"
        exit 0
        ;;
      *)
        echo "Invalid choice"
        break
        ;;

      esac
    done

    read -p "Press Enter to continue..."
  done
}
main_menu
