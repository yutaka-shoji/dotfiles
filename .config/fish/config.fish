# read local config file if exist
if test -f ~/.config/fish/config.fish.local
  source ~/.config/fish/config.fish.local
end

# aliases
alias vi='vim'

# for GNU ls colors
eval (dircolors -c ~/.dircolors)

#set -g __fish_git_prompt_show_informative_status
#set -g __fish_git_prompt_showdirtystate
#set -g __fish_git_prompt_showuntrackedfiles
#set -g __fish_git_prompt_showcolorhints
#set -g __fish_git_prompt_showupstream informative
#set -g __fish_git_prompt_char_stateseparator " "
#set -g __fish_git_prompt_char_cleanstate "✔"
#set -g __fish_git_prompt_char_dirtystate "✚"
#set -g __fish_git_prompt_char_invalidstate "✖"
#set -g __fish_git_prompt_char_stagedstate "●"
#set -g __fish_git_prompt_char_untrackedfiles "…"
#set -g __fish_git_prompt_char_upstream_ahead "↑"
#set -g __fish_git_prompt_char_upstream_behind "↓"
#set -g __fish_git_prompt_char_upstream_prefix ""
#set -g __fish_git_prompt_color_branch brmagenta
#set -g __fish_git_prompt_color_dirtystate blue
#set -g __fish_git_prompt_color_stagedstate yellow
#set -g __fish_git_prompt_color_invalidstate red
#set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
#set -g __fish_git_prompt_color_cleanstate green --bold
