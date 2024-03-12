#!/usr/bin/env bash

database_file_done="Done.txt"
database_file_undone="UnDone.txt"
database_file_deleted="Deleted.txt"

function show_tasks_undone() {

  echo "Tasks not done:"
  echo "---------------"
  cat "$database_file_undone"
}

function show_tasks_done() {

  echo "Tasks done:"
  echo "--------------"
  cat "$database_file_done"
}

function show_tasks_deleted() {

  echo "Tasks deleted:"
  echo "---------------"
  cat "$database_file_deleted"
}

function add_task() {

  echo "$1" >>"$database_file_undone"
  echo "Task added: $1"

}

function remove_task() {

  task_number=$1
  sed -i "${task_number}d" "$database_file_undone"
  echo "Task removed: $task_number"
}