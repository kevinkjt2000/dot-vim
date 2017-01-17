set showtabline=2     " always show tab pages line
function! MyTabLine()
  let s = ''
  for tab in range(1, tabpagenr('$'))
    let s .= '%' . tab . 'T' " start a tab

    let is_tab_active = (tab == tabpagenr())
    let s .= (is_tab_active ? '%#TabLineSel#' : '%#TabLine#')

    let s .= tab

    let num_windows_in_tab = tabpagewinnr(tab, '$')
    let s .= (num_windows_in_tab > 1 ? ':' . num_windows_in_tab : '')

    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[tabpagewinnr(tab) - 1]
    let bufname = bufname(bufnr)
    let s .= ' ' . (bufname != '' ? pathshorten(bufname) : '[Untitled]')

    let is_modified = getbufvar(bufnr, '&mod')
    let s .= (is_modified ? ' +' : '')
  endfor
  
  let s .= '%#TabLineFill#' " highlight gaps
  let s .= '%T' " resets tab page number?
  let s .= '%=' " seperate left-aligned from right-aligned
  let s .= '%#TabLine#' " set highlight for the 'X' below
  let s .= '%999XX' " places an 'X' at the far-right
  return s
endfunction
set tabline=%!MyTabLine()

