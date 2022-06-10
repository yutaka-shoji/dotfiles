# .bash_profile

# source .bash_profile.local
if [ -f ~/.bash_profile.local ]; then
  . ~/.bash_profile.local
fi

# source .bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
