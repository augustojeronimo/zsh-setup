#!/bin/bash
 
# --- profiles down --- #

IFS=$'\n' read -d '' -r -a profiles < <(dconf read /org/gnome/terminal/legacy/profiles:/list | tr -d "[]'" | tr ',' '\n' | tr -d ' ')

new_list=()
str_new_list='['

for profile in "${profiles[@]}"; do
    name=$(dconf read /org/gnome/terminal/legacy/profiles:/:$profile/name | tr -d "'" | tr -d '"')

    if [[ ! $name == dev-* ]]; then
	new_list+=("$profile")
    fi
done

for profile in "${new_list[@]}"; do
    str_new_list="$str_new_list'$profile',"
done

str_new_list="${str_new_list%,}]"

dconf write /org/gnome/terminal/legacy/profiles:/list "$str_new_list"

# --- profiles up --- #

sudo cp configs/.zshrc ~/.zshrc
sudo cp configs/pixegami-agnoster.zsh-theme ~/.oh-my-zsh/themes/pixegami-agnoster.zsh-theme

for dconf_file in configs/dev-*.dconf; do
    if [[ -f "$dconf_file" ]]; then
        profile_id=$(uuidgen)
        name=${dconf_file:8:-6}

        dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id "''"
        dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/name "'$name'"
        dconf load /org/gnome/terminal/legacy/profiles:/:$profile_id/ < "$dconf_file"

        old_list=$(dconf read /org/gnome/terminal/legacy/profiles:/list | sed 's/\]$//' || echo "[")
        new_list="$old_list"
        
        if [[ "$old_list" == "[]" ]]; then
            new_list="['$profile_id']"
        else
            new_list="$old_list, '$profile_id']"
        fi

        dconf write /org/gnome/terminal/legacy/profiles:/list "$new_list"
        dconf write /org/gnome/terminal/legacy/profiles:/default "'$profile_id'"
    fi
done
