# Environment variable for snippets in conf.d directory
# I can't place it in config.fish because conf.d files is executed before.
# Unfortunale some snippets need environment variable

# rbenv
set --export RBENV_ROOT /usr/local/var/rbenv
