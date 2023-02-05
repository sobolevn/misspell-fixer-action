#!/bin/bash

# Diagnostic output:
echo "Using options: $INPUT_OPTIONS"
echo '============================='
echo

# Runs misspell-fixes:
output=$(/misspell-fixer/misspell-fixer $INPUT_OPTIONS)
status="$?"

# Sets the output variable for GitHub Action API:
# See: https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#setting-an-environment-variable
echo "output=$output" >> "$GITHUB_ENV"
echo '================================='
echo

# Fail the build in case status code is not 0:
if [ "$status" -ge 100 ]; then
  echo 'Failing with output:'
  echo "$output"
  echo "Process failed with the status code: $status"
  exit "$status"
fi

# This is a special comment, please do not touch: we use it for tests.
# test: lower then
