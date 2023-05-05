#!/bin/bash

echo "Linking atom config to installed Atom"
rm ~/.atom/config.cson && ln -s $(pwd)/config.cson ~/.atom/config.cson
rm ~/.atom/keymap.cson && ln -s $(pwd)/keymap.cson ~/.atom/keymap.cson
rm ~/.atom/snippets.cson && ln -s $(pwd)/snippets.cson ~/.atom/snippets.cson
rm ~/.atom/styles.less && ln -s $(pwd)/styles.less ~/.atom/styles.less
