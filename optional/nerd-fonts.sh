#https://www.nerdfonts.com/
#https://github.com/basecamp/omakub/blob/master/bin/omakub-sub/font.sh
install_font() {
  local font_name=$1
  local url=$2
  local file_type=$3
  local file_name="${font_name/ Nerd Font/}"

  if ! $(fc-list | grep -i "$font_name" >/dev/null); then
    cd ~/Downloads
    wget -O "$file_name.zip" "$url"
    unzip "$file_name.zip" -d "$file_name"
    cp "$file_name"/*."$file_type" ~/.local/share/fonts
    rm -rf "$file_name.zip" "$file_name"
    fc-cache -v
    cd -
  fi
}

install_font "RobotoMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/RobotoMono.zip" "ttf"
install_font "CaskaydiaMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip" "ttf"
install_font "FiraMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip" "otf"
install_font "JetBrainsMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" "ttf"
install_font "MesloLGS Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip" "ttf"
