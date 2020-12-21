#!/bin/bash 
shopt -s dotglob nullglob
cd "$(dirname ${0})"

function main() {
    local project_dir="$(pwd)"
    local backups_dir="$project_dir/backups"
    mkdir -p "$backups_dir"

    symlink_configs "$project_dir/common" "$backups_dir"

    if [[ $(uname) == "Darwin" ]]; then
        symlink_configs "$project_dir/macos" "$backups_dir"
    fi
}

function symlink_configs() {
    local config_dir="$1"
    local backups_dir="$2"
    cd "$config_dir"

    for f in *; do
        local file_home_path="$HOME/$f"

        # backup non symlinks
        if [[ -e "$file_home_path" && ! -L "$file_home_path" ]]; then
            echo "'$f' found in HOME path, creating backup"
            mv "$file_home_path" "$backups_dir"
        fi

        if [[ -e "$file_home_path" ]]; then
            rm "$file_home_path"
        fi

        echo 'Creating symlink for '$f' in HOME path'
        ln -s "$(pwd)/$f" "$file_home_path"
    done
}

main
