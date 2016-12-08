#!/bin/bash

if eval "apm --version"; then
  echo "Atom package manager detected"
  apm install --package-list my-packages.txt
else
  echo "Atom package manager not available"
  echo "Install from Atom > Install Shell Commands"
fi

