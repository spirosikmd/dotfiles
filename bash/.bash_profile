if [ -f ~/.bashrc ]; then
  source ~/.bashrc
else
  echo "Could not find ~/.bashrc. Did you stow?"
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/spyros/.sdkman"
[[ -s "/Users/spyros/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/spyros/.sdkman/bin/sdkman-init.sh"
