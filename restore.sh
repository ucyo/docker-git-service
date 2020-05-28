#!/usr/bin/env bash

set -o noclobber  # Avoid overlay files (echo "hi" > foo)
set -o errexit    # Used to exit upon error, avoiding cascading errors
set -o pipefail   # Unveils hidden failures
set -o nounset    # Exposes unset variables
#set -o xtrace     # For debugging of errors with trace


# Restore config file
# Restore repositories
# Restore database
# Restore hooks
# Restart service
