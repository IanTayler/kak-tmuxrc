# Basic settings

# General
define-command -params 0 lne 'lint-next-error'
define-command -params 0 lpe 'lint-previous-error'

hook global BufCreate .* %{editorconfig-load}

# Python
hook global WinSetOption filetype=python %{
  jedi-enable-autocomplete
  lint-enable
  set-option global lintcmd 'python -m pylint'
  set-option global formatcmd 'python -m black -'
}

# JS
hook global WinSetOption filetype=javascript %{
  lint-enable
  set-option global lintcmd 'npx eslint --stdin'
  set-option global formatcmd 'npx prettier --parser babylon'
}

# Plugins
source ~/.config/kak/plugins/plug.kak/rc/plug.kak

plug "andreyorst/fzf.kak" "branch: master"

# Mappings
map -docstring "Start fzf mode." global user <space> ': fzf-mode<ret>'
map global insert <tab> '<a-;><gt>'
map global insert <s-tab> '<a-;><lt>'
