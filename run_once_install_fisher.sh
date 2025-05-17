#!/bin/bash

if command -v fish > /dev/null 2>&1; then
	fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'
fi
