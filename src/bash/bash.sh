#!/usr/bin/env bash

database_file_done="Done.txt"
database_file_undone="UnDone.txt"
database_file_deleted="Deleted.txt"

function show_tasks_undone() {

  echo "Tasks not done:"
  echo "---------------"
  cat "$database_file_undone"
}
