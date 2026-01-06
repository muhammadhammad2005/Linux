#!/bin/bash
if [ $# -eq 0 ]; then
  read -p "Enter a directory path: " path
else
  path=$1
fi

ls -l $path
