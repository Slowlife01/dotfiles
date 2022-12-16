#!/bin/bash

read -p "🔑 Do you want to setup GPG key now? [y/N] " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    gpg --full-generate-key
    gpg --list-secret-keys --keyid-format=long

    echo ""
    echo "🚀  Export GPG key with:"
    echo "    gpg --armor --export <key-id>"
fi
