<div align="center">

# dotfiles

**Arch Linux · Hyprland · Gruvbox Material Dark**

_by lexo0x00_

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=for-the-badge&logo=wayland&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-a9b665?style=for-the-badge)

</div>

## Preview

![Preview](./screenshots/20260331_145834.png)

---

## Contenido

| Config          | Descripción                                        |
| --------------- | -------------------------------------------------- |
| `hypr/`         | Hyprland — WM, keybinds, animaciones, window rules |
| `waybar/`       | Barra de estado con tema Gruvbox                   |
| `kitty/`        | Terminal con colores y fuente Nerd Font            |
| `fish/`         | Shell con aliases para pentest y HTB               |
| `tmux/`         | Multiplexor de terminal con tema Gruvbox           |
| `wofi/`         | Launcher de aplicaciones                           |
| `dunst/`        | Notificaciones                                     |
| `rofi/`         | Menú de aplicaciones y cheatsheet                  |
| `starship.toml` | Prompt de terminal                                 |

---

## Paleta de colores

| Color   | Hex       | Uso                      |
| ------- | --------- | ------------------------ |
| bg_hard | `#1d2021` | Fondo principal          |
| bg      | `#282828` | Fondo secundario         |
| fg      | `#ebdbb2` | Texto                    |
| green   | `#a9b665` | Bordes activos, comandos |
| yellow  | `#d8a657` | Workspaces activos       |
| blue    | `#7daea3` | Rutas, red               |
| red     | `#ea6962` | Errores                  |
| purple  | `#d3869b` | CPU, escape              |
| aqua    | `#89b482` | Temperatura, funciones   |

---

## Instalación

```bash
git clone https://github.com/lexoday/dotfiles.git
cd dotfiles
bash install.sh
```

El script automáticamente:

- Verifica dependencias
- Crea backup de tu config actual en `~/.config.bak.FECHA/`
- Instala todas las configs en `~/.config/`

---

## Desinstalar

```bash
bash uninstall.sh
```

El script:

- Elimina las configs instaladas
- Ofrece restaurar tu backup anterior

---

## Dependencias

```bash
sudo pacman -S hyprland hyprpaper hypridle hyprlock \
    waybar kitty fish tmux wofi dunst rofi-wayland \
    pipewire wireplumber pavucontrol \
    brightnessctl playerctl cliphist wl-clipboard \
    grimblast grim slurp ttf-jetbrains-mono-nerd
```

---

## Keybinds principales

| Atajo             | Acción                 |
| ----------------- | ---------------------- |
| `Super + Enter`   | Terminal               |
| `Super + D`       | Launcher               |
| `Super + F1`      | Cheatsheet de keybinds |
| `Super + h/j/k/l` | Mover foco (vim)       |
| `Super + 1-9`     | Workspaces             |
| `Super + L`       | Lockscreen             |
| `Super + W`       | Menú de redes          |
| `Print`           | Screenshot área        |

---

<div align="center">
<sub>Hecho con ❤️ para Arch Linux</sub>
</div>
