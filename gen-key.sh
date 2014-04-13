#!/bin/bash

HASH=$(python -c 'print open("/dev/urandom").read(24).encode("hex")')
sed -i 's/RANDOM_KEY/'$HASH'/g' ./roundcube/config.inc.php
