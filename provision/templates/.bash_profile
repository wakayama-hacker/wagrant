export COMPOSER_HOME=$HOME/.composer
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH

if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
