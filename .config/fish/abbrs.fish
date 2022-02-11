abbr c clear
abbr cfg '/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi'
abbr cp 'cp -i' # confirm before overwriting something
abbr df 'df -h' # human-readable sizes
abbr free 'free -m' # show sizes in MB
abbr mkdir 'mkdir -pv'
abbr mv 'mv -i'
abbr n nvim
abbr p 'ping google.com'
abbr py python
abbr pinst 'pip install'
abbr rm 'rm -I --preserve-root'
abbr s sudo
abbr sn sudoedit
abbr v. 'vifm ./'
abbr vim nvim
abbr wget 'wget -c'
abbr q exit
abbr e '~/scripts/edit_configs.sh'


abbr inst 'sudo pacman -Syu '
abbr update 'sudo pacman -Syu'
# abbr lspk 'sudo pacman -S  '
abbr rpkg 'sudo pacman -R'

# if echo $DISTRO | grep -qi "ubuntu"
#     abbr inst 'sudo apt install' 
#     abbr update 'sudo apt update; sudo apt upgrade'
#     abbr lspk 'sudo apt list| grep'
#     abbr rpkg 'sudo apt remove'
# else if echo $DISTRO | grep -qi "arch"
#     abbr rpkg 'sudo pacman -R'
#     abbr inst 'sudo pacman -S'
#     abbr update 'sudo pacman -Syu'
#     abbr lspk 'sudo pacman -Qqs'
# end

if type -q exa
    abbr l 'exa --icons'
    abbr la 'exa -hla --icons'
else
    abbr l ls
    abbr la 'ls -lha'
end
