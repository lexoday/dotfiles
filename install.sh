#!/bin/bash
# ================================================
#   DOTFILES INSTALLER — lexo0x00
#   Arch Linux · Gruvbox Material Dark
# ================================================

set -e

# ── COLORES ──
RED='\033[38;2;234;105;98m'
GREEN='\033[38;2;169;182;101m'
YELLOW='\033[38;2;216;166;87m'
BLUE='\033[38;2;125;174;163m'
GRAY='\033[38;2;168;153;132m'
BOLD='\033[1m'
RESET='\033[0m'

# ── FUNCIONES ───
info() { echo -e "${BLUE}${BOLD}[*]${RESET} $1"; }
success() { echo -e "${GREEN}${BOLD}[+]${RESET} $1"; }
warning() { echo -e "${YELLOW}${BOLD}[!]${RESET} $1"; }
error() { echo -e "${RED}${BOLD}[-]${RESET} $1"; }

# ── BANNER ──
echo -e "${GREEN}${BOLD}"
echo "  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗"
echo "  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝"
echo "  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗"
echo "  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║"
echo "  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║"
echo "  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝"
echo -e "${RESET}"
echo -e "${GRAY}  Arch Linux · Gruvbox Material Dark · lexo0x00${RESET}"
echo -e "${GRAY}  ─────────────────────────────────────────────${RESET}"
echo ""

# ── DIRECTORIO DEL REPO ──
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config.bak.$(date +%Y%m%d_%H%M%S)"

# ── CONFIGS A INSTALAR ──
CONFIGS=(
  "hypr"
  "waybar"
  "kitty"
  "fish"
  "tmux"
  "wofi"
  "dunst"
  "rofi"
)

FILES=(
  "starship.toml"
)

# ── BACKUP ──
backup_config() {
  local src="$1"
  local name="$(basename $src)"

  if [ -e "$src" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -r "$src" "$BACKUP_DIR/${name}.bak"
    warning "Backup creado: $BACKUP_DIR/${name}.bak"
  fi
}

# ── INSTALAR ──
install_config() {
  local name="$1"
  local src="$DOTFILES_DIR/$name"
  local dst="$CONFIG_DIR/$name"

  if [ ! -e "$src" ]; then
    warning "No encontrado: $name — saltando"
    return
  fi

  # Backup si existe
  backup_config "$dst"

  # Copiar
  mkdir -p "$CONFIG_DIR"
  cp -r "$src" "$dst"
  success "Instalado: $name → $dst"
}

install_file() {
  local name="$1"
  local src="$DOTFILES_DIR/$name"
  local dst="$CONFIG_DIR/$name"

  if [ ! -e "$src" ]; then
    warning "No encontrado: $name — saltando"
    return
  fi

  backup_config "$dst"
  cp "$src" "$dst"
  success "Instalado: $name → $dst"
}

# ── VERIFICAR DEPENDENCIAS ──
check_deps() {
  info "Verificando dependencias..."
  local deps=(hyprland waybar kitty fish tmux wofi dunst rofi)
  local missing=()

  for dep in "${deps[@]}"; do
    if ! command -v "$dep" &>/dev/null; then
      missing+=("$dep")
    fi
  done

  if [ ${#missing[@]} -gt 0 ]; then
    warning "Dependencias faltantes: ${missing[*]}"
    echo -e "${GRAY}  Instala con: sudo pacman -S ${missing[*]}${RESET}"
    echo ""
  else
    success "Todas las dependencias están instaladas"
  fi
}

# ── MAIN ───
main() {
  info "Iniciando instalación de dotfiles..."
  echo ""

  check_deps
  echo ""

  info "Instalando configs..."
  for config in "${CONFIGS[@]}"; do
    install_config "$config"
  done

  for file in "${FILES[@]}"; do
    install_file "$file"
  done

  echo ""
  success "¡Instalación completada!"
  echo ""
  echo -e "${GRAY}  Backups guardados en: $BACKUP_DIR${RESET}"
  echo -e "${GRAY}  Para remover: bash uninstall.sh${RESET}"
  echo ""
  echo -e "${YELLOW}  Reinicia Hyprland para aplicar los cambios.${RESET}"
}

main
