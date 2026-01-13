#!/bin/bash
echo "=== Permission Testing Script ==="
echo "User: $(whoami)"
echo "Directory: $(pwd)"

echo
echo "Files:"
ls -l *.txt *.sh 2>/dev/null

echo
echo "Directory:"
ls -ld testdir

echo
echo "ACL Files:"
ls -l | grep "+"

echo
echo "ACL Details:"
getfacl acltest.txt 2>/dev/null
