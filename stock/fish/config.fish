# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

source ~/.config/fish/me.fish
source ~/.config/fish/work.fish


# Added by Windsurf
fish_add_path /Users/sheldon.kwok/.codeium/windsurf/bin
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
