#!/bin/bash

# Diagnostic output:
echo "Using options: $INPUT_OPTIONS"
echo '============================='
echo

# Runs misspell-fixes:
output=$(/misspell-fixer/misspell-fixer $INPUT_OPTIONS)
status="$?"

# Sets the output variable for Github Action API:
# See: https://help.github.com/en/articles/development-tools-for-github-action
echo "::set-output name=output::$output"
echo '================================='
echo

# Fail the build in case status code is not 0:
if [ "$status" -ge 100 ]; then
  echo 'Failing with output:'
  echo "$output"
  echo "Process failed with the status code: $status"
  exit "$status"
fi
