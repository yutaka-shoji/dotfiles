function fish_prompt --description 'Write out the prompt'

  echo -n \n

  # read local config file if exist
  if test -f ~/.config/fish/functions/fish_prompt.fish.local
    source ~/.config/fish/functions/fish_prompt.fish.local
  end

  set_color blue
  echo -ns "$USER"
  if test -n "$SSH_CONNECTION"
    echo -ns '@' (prompt_hostname)
  end
  echo -ns '[' (prompt_pwd) ']'
  set_color yellow
  printf '%s' (fish_git_prompt)

  set_color normal
  echo -ns \n '$ '

end
