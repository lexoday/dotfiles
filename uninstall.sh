#!/bin/bash
# ================================================
#   DOTFILES UNINSTALLER — lexo0x00
# ================================================

set -e

RED='\033[38;2;234;105;98m'
GREEN='\033[38;2;169;182;101m'
YELLOW='\033[38;2;216;166;87m'
BLUE='\033[38;2;125;174;163m'
GRAY='\033[38;2;168;153;132m'
BOLD='\033[1m'
RESET='\033[0m'

info()    { echo -e "${BLUE}${BOLD}[*]${RESET} $1"; }
success() { echo -e "${GREEN}${BOLD}[+]${RESET} $1"; }
warning() { echo -e "${YELLOW}${BOLD}[!]${RESET} $1"; }

CONFIG_DIR="$HOME/.config"

CONFIGS=(
    "hypr"
    "waybar"
    "kitty"
    "fish"
    "tmux"
    "wofi"
    "dunst"
    "rofi"
    "starship.toml"
)

echo -e "${RED}${BOLD}"
echo "  ██╗   ██╗███╗   ██╗██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗"
echo "  ██║   ██║████╗  ██║██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║"
echo "  ██║   ██║██╔██╗ ██║██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║"
echo "  ██║   ██║██║╚██╗██║██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║"
echo "  ╚██████╔╝██║ ╚████║██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗"
echo "  ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝"
echo -e "${RESET}"

echo -e "${YELLOW}${BOLD}[!] Esto eliminará las configs instaladas.${RESET}"
read -p "    ¿Continuar? [y/N]: " confirm
[[ "$confirm" != "y" && "$confirm" != "Y" ]] && echo "Cancelado." && exit 0

echo ""
info "Removiendo configs..."

for config in "${CONFIGS[@]}"; do
    target="$CONFIG_DIR/$config"
    if [ -e "$target" ]; then
        rm -rf "$target"
        success "Removido: $target"
    else
        warning "No encontrado: $target — saltando"
    fi
done

echo ""

# Restaurar backup si existe
LATEST_BACKUP=$(ls -td "$HOME"/.config.bak.* 2>/dev/null | head -1)
if [ -n "$LATEST_BACKUP" ]; then
    echo -e "${YELLOW}  Backup encontrado: $LATEST_BACKUP${RESET}"
    read -p "  ¿Restaurar backup? [y/N]: " restore
    if [[ "$restore" == "y" || "$restore" == "Y" ]]; then
        for bak in "$LATEST_BACKUP"/*.bak; do
            name=$(basename "$bak" .bak)
            cp -r "$bak" "$CONFIG_DIR/$name"
            success "Restaurado: $name"
        done
        success "Backup restaurado desde: $LATEST_BACKUP"
    fi
fi

echo ""
success "¡Desinstalación completada!"
