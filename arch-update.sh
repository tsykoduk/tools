#bin/bash
echo -e "\n\n\033[34m  **Cleaning up a little**  \033[0;39m"
echo -e "\033[34m  **Authorization Needed**  \033[0;39m\n"
sudo pacman -Sc --noconfirm --color=auto
echo -e "\n\033[34m  **Kicking off Upgrade**  \033[0;39m\n"
sudo pacman -Syu --noconfirm --color=auto
