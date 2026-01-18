#!/bin/bash
set -e

[ -z "$1" ] && read -p "Enter a number: " num || num=$1

if ! [[ "$num" =~ ^[0-9]+$ ]]; then
  echo "Error: Please enter a valid number." >&2
  exit 1
fi

echo "Result: $((num * 2))"
