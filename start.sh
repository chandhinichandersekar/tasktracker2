#!/bin/bash

export PORT=5140

cd ~/www/tasktracker
./bin/tasktracker stop || true
./bin/tasktracker start
