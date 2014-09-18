#!/bin/bash

HASH=$(python2 -c 'print open("/dev/urandom").read(24).encode("hex")')
sed -i 's/RANDOM_KEY/'$HASH'/g' ./roundcube/config.inc.php
