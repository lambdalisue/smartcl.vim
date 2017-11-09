if exists('g:smartcl_loaded')
  finish
endif
let g:smartcl_loaded = 1

if get(g:, 'smartcl_startup', 1)
  call smartcl#enable()
endif
