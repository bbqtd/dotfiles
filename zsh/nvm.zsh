### NVM

# Load and configure NVM if exist `.nvmrc` and if you want.
# ADD: add better interactive choice for decline load and configurin nvm
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    if [[ -z $NVM_DIR ]]; then
      echo "nvm-loader: init nvm"
      export NVM_DIR="$HOME/.nvm"
      source "$( brew --prefix nvm )/nvm.sh"
    fi
    if [[ $( cat .nvmrc ) != "$NVM_ZLOADER" ]]; then
      read "ANS?nvm-loader: load .nvmrc?"
      if [[ -z $ANS ]]; then
        echo "nvm-loader: applying .nvmrc"
        nvm install
        export NVM_ZLOADER=$( cat .nvmrc )
      fi
    else
      nvm current
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
