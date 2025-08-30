#!/bin/bash

ansi_art='
\033[37m                     .ed"""" """$$$$be.\033[0m
\033[37m                   -"           ^""**$$$e.\033[0m
\033[37m                 ."                   '\''$$$c\033[0m
\033[37m                /                      "4$$b\033[0m
\033[37m               d  3                      $$$$\033[0m
\033[37m               $  *                   .$$$$$$\033[0m
\033[37m              .$  ^c           $$$$$e$$$$$$$$.\033[0m
\033[37m              d$L  4.         4$$$$$$$$$$$$$$b\033[0m
\033[37m              $$$$b ^ceeeee.  4$$ECL.F*$$$$$$$\033[0m
\033[37m  e$""=.      $$$$P d$$$$F $ $$$$$$$$$- $$$$$$\033[0m
\033[37m z$$b. ^c     3$$$F "$$$$b   $"$$$$$$$  $$$$*"      .=""$c\033[0m
\033[37m4$$$$L        $$P"  "$$b   .$ $$$$$...e$$        .=  e$$$.\033[0m
\033[37m^*$$$$$c  %..   *c    ..    $$ 3$$$$$$$$$$eF     zP  d$$$$$\033[0m
\033[37m  "**$$$ec   "   %ce""    $$$  $$$$$$$$$$*    .r" =$$$$P""\033[0m
\033[37m        "*$b.  "c  *$e.    *** d$$$$$"L$$    .d"  e$$***"\033[0m
\033[37m          ^*$$c ^$c $$$      4J$$$$$% $$$ .e*".eeP"\033[0m
\033[37m             "$$$$$$"'\''$=e....$*$$**$cz$$" "..d$*"\033[0m
\033[37m               "*$$$  *=%4.$ L L$ P3$$$F $$$P"\033[0m
\033[37m                  "$   "%*ebJLzb$e$$$$$b $P"\033[0m
\033[37m                    %..      4$$$$$$$$$$ "\033[0m
\033[37m                     $$$e   z$$$$$$$$$$%\033[0m
\033[37m                      "*$c  "$$$$$$$P"\033[0m
\033[37m                       ."""*$$$$$$$$bc\033[0m
\033[37m                    .-"    .$***$$$"""*e.\033[0m
\033[37m                 .-"    .e$"     "*$c  ^*b.\033[0m
\033[37m          .=*""""    .e$*"          "*bc  "*$e..\033[0m
\033[37m        .$"        .z*"               ^*$e.   "*****e.\033[0m
\033[37m        $$ee$c   .d"                     "*$.        3.\033[0m
\033[37m        ^*$E")$..$"                         *   .ee==d%\033[0m
\033[37m           $.d$$$*                           *  J$$$e*\033[0m
\033[37m            """""                              "$$$"\033[0m
'

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

# Use custom repo if specified, otherwise default to basecamp/omarchy
OMARCHY_REPO="${OMARCHY_REPO:-basecamp/omarchy}"
TITUS_REPO="${TITUS_REPO:-mdmattsson/omarchy-mattsson}"

echo -e "\nCloning Omarchy from: https://github.com/${OMARCHY_REPO}.git"
rm -rf ~/.local/share/omarchy/
git clone "https://github.com/${OMARCHY_REPO}.git" ~/.local/share/omarchy >/dev/null

echo -e "\nCloning Mattsson-Omarchy from: https://github.com/${TITUS_REPO}.git"
rm -rf ~/.local/share/omarchy-mattsson/
git clone "https://github.com/${TITUS_REPO}.git" ~/.local/share/omarchy-mattsson >/dev/null

# Use custom branch if instructed
if [[ -n "$OMARCHY_REF" ]]; then
  echo -e "\eUsing branch: $OMARCHY_REF"
  cd ~/.local/share/omarchy
  git fetch origin "${OMARCHY_REF}" && git checkout "${OMARCHY_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omarchy-mattsson/install.sh
