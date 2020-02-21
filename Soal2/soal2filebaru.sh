#!/bin/bash

newpass=$1
code=$(</dev/urandom tr -dc 'a-zA-Z0-9' | head -c 28)
echo $code > "$newpass".txt
