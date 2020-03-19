#!/bin/bash

# Diagnostic output:
echo "Using options: $INPUT_OPTIONS"
echo '============================='
echo

# Runs misspell-fixes:
/misspell-fixer/misspell-fixer $INPUT_OPTIONS

# test: lower then
