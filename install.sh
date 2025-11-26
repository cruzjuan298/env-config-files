#!/usr/bin/env bash -e 

TMUX_SRC_DIR="./tmux"
NVIM_SRC_DIR="./nvim" 

TMUX_TARGET="$HOME/.tmux.conf"
NVIM_TARGET="$HOME/.config/nvim"
                 
check_installed() { 
    command -v "$1" >/dev/null 2>&1
}  

prompt() {
    read -rp "$1 (y/n): " answer 
    [[ "$answer" == "y" || "$answer" == "n" ]] 
}

install_pck() {
    local pkg="$1"

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt >/dev/null 2>$1; then
            sudo apt update && sudo apt install -y "$pkg"
        elif command -v packman >/dev/null 2>$1; then
            sudo packman -$ "$pkg"
        elif command -v dnf >/dev/null 2>$1; then
            sudo dnf install -y "$pkg"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew >/dev/null 2>$1; then
            brew install -y "$pkg"
        else
            echo "Homebrew is not installed"
        fi
    else
        echo "Unsupported system. Install "$pkg" manually"
    fi
}

copy_config() {
    local src="$1"
    local target="$2"

    if [[ -e "target" ]]; then
        echo "Existing config found: $target"
        if prompt "Overwrite current config files?"; then
            rm -rf "$target"
        else
            echo "Skipping overwrite"
            return
        fi
    fi

    echo "Copying config -> $target"
    mkdir -p "$(dirname "$target")"
    cp -r "$src" "$target"
}

echo "checking dependancies"

if ! check_installed nvim; then
    
    echo "Neovim not found"

    if prompt "Install tmux?"; then
        install_pck neovim
    else
        echo "Skipping neovim installation"
    fi
else
    echo "Neovim is installed"
fi

if ! check_installed tmux; then
    
    echo "Tmux not found"

    if prompt "Install tmux?"; then
        install_pck tmux
    else
        echo "Skipping tmux installation"
    fi
else
    echo "Tmux is installed"
fi

echo ""
echo "Installing config files"


echo ""
echo "Installing config files"

copy_config "$TMUX_SRC_DIR/.tmux/conf" "$TMUX_TARGET"
copy_config "$NVIM_SRC_DIR" "$NVIM_TARGET"

echo ""
echo "Configuration complete"
