#!/bin/bash

HASH=$(cat /dev/urandom | tr -dc 'a-f0-9' | fold -w 48 | head -n 1)
sed -i 's/RANDOM_KEY/'$HASH'/g' ./roundcube/config.inc.php
