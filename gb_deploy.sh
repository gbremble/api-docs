#!/usr/bin/env bash
message=${0}
git add -A
git commit -m "$message"
git push
./deploy.sh