#!/bin/bash

python3 kafkaConsumeSmashing.py &
bundle
smashing start -p 5000
tail -f /dev/null
#sleep 1h