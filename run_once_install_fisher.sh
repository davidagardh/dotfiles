#!/bin/bash

if command -v fish > /dev/null 2>&1; then
	fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'
	curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin/
fi
