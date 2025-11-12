#!/bin/bash
# Wrapper script to force complete output flush from mcmas

# Run mcmas and capture all output with stdbuf (unbuffered)
exec stdbuf -o0 -e0 "$(dirname "$0")/mcmas" "$@"
