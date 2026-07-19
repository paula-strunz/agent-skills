#!/usr/bin/env bash
# agent-skills installer
# Symlinks these skills into ~/.claude and/or a project's agent skill folders.
#
# Usage:
#   ./install.sh                              # link all skills into ~/.claude
#   ./install.sh /path/to/project             # link all skills into a project
#   ./install.sh /path/to/project --only a,b  # link only skills a and b
#   ./install.sh --only a,b                   # link only a,b into ~/.claude

set -e
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROJECT=""
ONLY=""
while [ $# -gt 0 ]; do
    case "$1" in
        --only) ONLY="$2"; shift 2 ;;
        *)      PROJECT="$1"; shift ;;
    esac
done

# Link a full skills/ dir (fast path) or a chosen subset into <target>.
link_skills() {
    local target_dir="$1"   # e.g. .../.claude/skills
    if [ -z "$ONLY" ]; then
        # Whole set: one symlink to skills/, so new skills appear automatically.
        local parent; parent="$(dirname "$target_dir")"
        mkdir -p "$parent"
        [ -e "$target_dir" ] && [ ! -L "$target_dir" ] && mv "$target_dir" "$target_dir.pre-symlink-backup"
        ln -sfn "$REPO_DIR/skills" "$target_dir"
        echo "Linked $target_dir -> $REPO_DIR/skills"
    else
        # Subset: real dir with one symlink per chosen skill.
        [ -L "$target_dir" ] && rm "$target_dir"
        mkdir -p "$target_dir"
        IFS=',' read -ra names <<< "$ONLY"
        for n in "${names[@]}"; do
            n="$(echo "$n" | xargs)"   # trim whitespace
            if [ ! -d "$REPO_DIR/skills/$n" ]; then
                echo "  skip: no such skill '$n'"; continue
            fi
            ln -sfn "$REPO_DIR/skills/$n" "$target_dir/$n"
            echo "Linked $target_dir/$n"
        done
    fi
}

if [ -n "$PROJECT" ]; then
    for dir in ".claude" ".agents" ".codex"; do
        link_skills "$PROJECT/$dir/skills"
    done
else
    link_skills "$HOME/.claude/skills"
fi

echo "Done."
