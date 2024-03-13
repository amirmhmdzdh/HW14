#!/usr/bin/env bash

database_file_done="Done.txt"
database_file_undone="UnDone.txt"
database_file_deleted="Deleted.txt"

function show_tasks_undone {

  echo "Tasks not done:"
  echo "---------------"
  cat "$database_file_undone"
}

function show_tasks_done {

  echo "Tasks done:"
  echo "--------------"
  cat "$database_file_done"
}

function show_tasks_deleted {

  echo "Tasks deleted:"
  echo "---------------"
  cat "$database_file_deleted"
}

function add_task {

  echo "$1" >>"$database_file_undone"
  echo "Task added: $1"

}

function move_task_to_done {

  task_number=$1
  task=$(sed -n "${task_number}p" "$database_file_undone")

  echo "$task" >>"$database_file_done"
  sed -i "${task_number}d" "$database_file_undone"
  echo "Task marked as done and moved to 'done.txt'"
}

function delete_task {

  task_number=$1
  task=$(sed -n "${task_number}p" "$database_file_undone")

  echo "$task" >>"$database_file_deleted"
  sed -i "${task_number}d" "$database_file_undone"
  echo "Task moved to 'Deleted.txt'"

}

function search_tasks {

  read -p "Enter the search Phrase: " search_Phrase
  echo "Search results:"
  echo "--------------"

  echo "Tasks not done:"
  echo "--------------"
  grep -n "$search_Phrase" "$database_file_undone"

  echo "Tasks done:"
  echo "--------------"
  grep -n "$search_Phrase" "$database_file_done"

  echo "Tasks deleted:"
  echo "--------------"
  grep -n "$search_Phrase" "$database_file_deleted"

}
function main_menu {
  while true; do
    echo ""
    echo "Main Menu:"
    echo "1. Show tasks not done"
    echo "2. Show tasks done"
    echo "3. Show tasks deleted"
    echo "4. Add task"
    echo "5. Move task to 'Deleted.txt'"
    echo "6. Mark task as done and move to 'done.txt'"
    echo "7. Search tasks"
    echo "8. Exit"
    read -p "Enter your choice: " choice

    case $choice in
    1)
      show_tasks_undone
      ;;
    2)
      show_tasks_done
      ;;
    3)
      show_tasks_deleted
      ;;
    4)
      read -p "Enter the task description: " task_description
      add_task "$task_description"
      ;;
    5)
      read -p "Enter the task number to move to 'Deleted.txt': " task_number
      delete_task "$task_number"
      ;;
    6)
      read -p "Enter the task number to mark as done and move: " task_number
      move_task_to_done "$task_number"
      ;;

    7)
      search_tasks
      ;;

    8)
      echo "Goodbye!"
      exit 0
      ;;

    *)
      echo "Invalid choice"
      ;;
    esac
  done
}

main_menu
