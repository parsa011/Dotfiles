:source ~/.spacevim/vimrc
let g:vimfiler_tree_opened_icon = get(g:, 'vimfiler_tree_opened_icon', '-')
let g:vimfiler_tree_closed_icon = get(g:, 'vimfiler_tree_closed_icon', '+')
if has("gui_running")
  if has("gui_win32")
    set guifont=SauceCodePro_Nerd_Font:h11
  endif
endif

