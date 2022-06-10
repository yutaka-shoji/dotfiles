# .bashrc

# Source local definitions
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

# call fish shell
if type fish > /dev/null 2>&1; then
  case $- in
    *i*)
      exec fish;;
      *)
      return;;
  esac
else
  echo "fish is NOT installed (.bashrc)"
fi

# call zsh shell
#if type zsh > /dev/null 2>&1; then
#  case $- in
#    *i*)
#      exec zsh;;
#      *)
#      return;;
#  esac
#else
#  echo "zsh is NOT installed (.bashrc)"
#fi
