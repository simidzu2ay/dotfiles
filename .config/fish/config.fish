if status is-interactive
  starship init fish | source
  export GPG_TTY=$(tty)
end

function fish_greeting
echo -e "Welcome to fish, the friendly interactive shell"
echo -e "Type \e[1;32mhelp\e[m for instructions on how to use fish"
echo -e "Don't forget to use \e[1;32mds-badge\e[m once a month"
end
alias ls="exa"

set -gx PNPM_HOME "/home/simidzu/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
