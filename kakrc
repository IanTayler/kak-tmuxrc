# Basic settings

# General
define-command -params 0 lne 'lint-next-error'
define-command -params 0 lpe 'lint-previous-error'

hook global BufCreate .* %{editorconfig-load}

hook global BufCreate .*[.](js)x? %{
  set-option buffer filetype javascript
}

# Python
hook global WinSetOption filetype=python %{
  jedi-enable-autocomplete
  lint-enable
  set-option window lintcmd 'python -m pylint'
  set-option window formatcmd 'python -m black -'
}

# JS
hook global WinSetOption filetype=(javascript|js|typescript) %{
  set-option window lintcmd 'npx eslint --format unix'
  set-option window formatcmd 'npx prettier --parser babylon'
}

# Plugins
source ~/.config/kak/plugins/plug.kak/rc/plug.kak

plug "andreyorst/fzf.kak" "branch: master"

# Mappings
map -docstring "Start fzf mode." global user <space> ': fzf-mode<ret>'
map global insert <tab> '<a-;><gt>'
map global insert <s-tab> '<a-;><lt>'
