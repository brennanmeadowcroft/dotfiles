#!/bin/bash

echo "Backing up installed packages for Atom"
apm list --bare --installed > my-packages.txt
