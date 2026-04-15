#!/bin/bash

cp .kristenrc $HOME/.kristenrc
echo "source $HOME/.kristenrc" >> $HOME/.bashrc

# Claude Code global instructions
mkdir -p $HOME/.claude
ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/CLAUDE.md $HOME/.claude/CLAUDE.md

# Define an array of commands to add to history
commands_to_add=(
    "dc logs -f --tail=100 ssr web"
    "m dev_create_facilities_fixture_data"
    "docker system prune -a"
    "dc up -d"
    "m makemigrations"
    "git pull origin master --rebase --autostash"
    "cd /workspaces/web/src/frontend/rsdk && m generate_api_schemas && pnpm run build:apiClient cd /workspaces/web"
    "source /workspaces/.codespaces/.persistedshare/dotfiles/.kristenrc"
    "m prod_reindex_grooming_services"
)

# We will have two lines for the process count but it works
# echo "processes = 4" >> "/workspaces/web/config/wsgi/development.ini"

# Add each command in the array to the history
for cmd in "${commands_to_add[@]}"; do
    echo "$cmd" >> ~/.bash_history
done

# Ensure history is updated immediately
shopt -s histappend     # Append to history, don't overwrite
PROMPT_COMMAND="history -a; history -n"  # Append and read history immediately
