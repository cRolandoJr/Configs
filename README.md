# Configs

Personal configuration files for Hyprland, Waybar, Kitty, Zsh, Neovim and Rofi.

## Contents

- **Hyprland** - Dynamic tiling Wayland compositor configuration
- **Waybar** - Customizable Wayland bar for Hyprland
- **Kitty** - Fast, GPU-based terminal emulator
- **Zsh** - Z shell with Oh My Zsh framework
- **Neovim** - Modern Vim-based text editor
- **Rofi** - Application launcher and dmenu replacement

## Installation

### Prerequisites

Make sure you have the following packages installed:

```bash
# Arch Linux / Manjaro
sudo pacman -S hyprland waybar kitty zsh neovim rofi

# Additional dependencies
sudo pacman -S ttf-jetbrains-mono-nerd dunst polkit-gnome wofi grim slurp wl-clipboard wpctl brightnessctl
```

> Note: Rofi is an X11 launcher but works fine under many Wayland setups (via XWayland). If you prefer a Wayland-native launcher, consider using wofi instead.

### Setup Instructions

1. **Clone this repository:**
   ```bash
   git clone https://github.com/cRolandoJr/Configs.git ~/Configs
   cd ~/Configs
   ```

2. **Install Hyprland configuration:**
   ```bash
   mkdir -p ~/.config/hypr
   cp hyprland/hyprland.conf ~/.config/hypr/
   ```

3. **Install Waybar configuration:**
   ```bash
   mkdir -p ~/.config/waybar
   cp waybar/config ~/.config/waybar/
   cp waybar/style.css ~/.config/waybar/
   ```

4. **Install Kitty configuration:**
   ```bash
   mkdir -p ~/.config/kitty
   cp kitty/kitty.conf ~/.config/kitty/
   ```

5. **Install Zsh configuration:**
   ```bash
   # Install Oh My Zsh if not already installed
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   
   # Install plugins
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   
   # Copy configuration
   cp zsh/.zshrc ~/
   
   # Set Zsh as default shell
   chsh -s $(which zsh)
   ```

6. **Install Neovim configuration:**
   ```bash
   mkdir -p ~/.config/nvim
   cp nvim/init.lua ~/.config/nvim/
   ```

7. **Install Rofi configuration:**
   ```bash
   # Create rofi config directory and copy provided config (if present)
   mkdir -p ~/.config/rofi
   cp -r rofi/* ~/.config/rofi/ || true
   ```

   You can start Rofi with:
   ```bash
   rofi -show drun    # Application launcher
   rofi -show run     # Run prompt
   ```

## Configuration Details

### Hyprland

The Hyprland configuration includes:
- **Keybindings**: Super key as the main modifier
- **Window Management**: Dynamic tiling with dwindle layout
- **Animations**: Smooth transitions and effects
- **Startup Applications**: Waybar, dunst, and polkit agent
- **Media Keys**: Volume and brightness controls

Key bindings:
- `Super + Return` - Launch Kitty terminal
- `Super + Q` - Close active window
- `Super + R` - Launch application launcher (rofi)
- `Super + [1-9]` - Switch to workspace
- `Super + Shift + [1-9]` - Move window to workspace

### Waybar

Features:
- **Workspaces**: Shows Hyprland workspaces
- **System Monitors**: CPU, memory, temperature
- **Network**: Connection status and signal strength
- **Audio**: Volume control with PulseAudio
- **Battery**: Status and percentage
- **Clock**: Time and date display

### Kitty

Configured with:
- **Theme**: Tokyo Night color scheme
- **Font**: JetBrainsMono Nerd Font
- **Opacity**: 95% transparent background
- **Shortcuts**: Standard terminal keybindings

### Zsh

Features:
- **Framework**: Oh My Zsh
- **Plugins**: Git, autosuggestions, syntax highlighting, and more
- **Aliases**: Common commands and shortcuts
- **Functions**: Extract archives, create and cd into directories
- **History**: Shared history across sessions

### Neovim

Configuration includes:
- **Modern Lua-based**: Uses init.lua instead of init.vim
- **Essential Settings**: Line numbers, smart indenting, clipboard integration
- **Key Mappings**: Space as leader key, window navigation, buffer management
- **Autocommands**: Highlight on yank, trim whitespace, remember cursor position
- **File Explorer**: Built-in Netrw file browser

### Rofi

Rofi is included as an application launcher and dmenu replacement. The repository may include a sample configuration under the `rofi/` directory. Rofi is typically invoked with `rofi -show drun` for launching applications or `rofi -show run` for running commands.

If you want a theme, place .rasi theme files in `~/.config/rofi/` and reference them with `rofi -theme <theme.rasi>`.

## Customization

Feel free to customize these configurations to your liking:

- Edit keybindings in `hyprland/hyprland.conf`
- Modify colors in `waybar/style.css`
- Change terminal theme in `kitty/kitty.conf`
- Add aliases in `zsh/.zshrc`
- Extend Neovim with plugins in `nvim/init.lua`
- Adjust Rofi themes or styles in `rofi/` or `~/.config/rofi/`

## Credits

These configurations are inspired by various dotfile repositories and the community around each tool.

## License

MIT License - Feel free to use and modify as needed.
