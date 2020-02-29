#!/bin/bash

password=$1
code=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c28)
echo $code
