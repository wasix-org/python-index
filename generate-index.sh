#!/bin/bash

# Construct the list for the package-list file, from the files inside of packages
# and save it to packages/packages-list

cd packages
# Get the list of files in the packages directory
packages=$(ls *.whl)
cd ..
# Save the list to packages/packages-list
echo "$packages" > packages/packages-list

uv run dumb-pypi --package-list packages/packages-list --output-dir=dist --packages-url=https://wasix-org.github.io/python-index/packages/
cp -r packages dist/packages
