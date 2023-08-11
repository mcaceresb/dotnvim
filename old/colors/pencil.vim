" Pencil is a pretty cool color scheme, but I'm used to a bit more
" boldness and less pink. I made these changes to it and it looks better
" to me. (NOTE: You only preferred this white and gray bc of red shift)

if ! exists("g:pencil_bolder")
  let g:pencil_bolder = 0
endif

let s:light_blue_grey = { "gui": "#5B80A6", "cterm": "67"  }
let s:light_blue_grey = { "gui": "#557799", "cterm": "67"  }
let s:blue_grey       = { "gui": '#3C4C72', "cterm": "61"  }
let s:white           = { "gui": "#FFFFFF", "cterm": "15"  }
" let s:lighter_gray    = { "gui": "#EEEFEF", "cterm": "251" }
let s:lighter_gray    = { "gui": "#C0CADA", "cterm": "250" }
let s:dark_green      = { "gui": "#10A778", "cterm": "36"  }
" let s:light_green     = { "gui": "#5FD7A7", "cterm": "71"  }
" let s:light_green     = { "gui": "#5FD7A7", "cterm": "79"  }
" let s:light_green     = { "gui": "#5FD7A7", "cterm": "108"  }
let s:light_green     = { "gui": "#5FAF87", "cterm": "72"  }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "32"  }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "31"  }
let s:light_cyan      = { "gui": "#4FB8CC", "cterm": "73"  }
let s:light_cyan      = { "gui": "#50AFD7", "cterm": "74"  }
" let s:light_cyan      = { "gui": "#4FB8CC", "cterm": "108"  }
" let s:pink            = { "gui": "#fb007a", "cterm": "198" }
" let s:light_purple    = { "gui": "#6855DE", "cterm": "133"  }
let s:light_purple    = { "gui": "#B26EB2", "cterm": "133"  }
let s:light_black     = { "gui": "#585858", "cterm": "240" }
let s:black           = { "gui": "#282C34", "cterm": "0"   }

if &background == "dark"
  let s:bluez           = s:light_blue_grey
  " let s:medium_gray     = { "gui": "#767676", "cterm": "247" }
  let s:medium_gray     = { "gui": "#6f7884", "cterm": "242" }
else
  let s:bluez           = s:blue_grey
  let s:medium_gray     = { "gui": "#767676", "cterm": "244" }
endif

if g:pencil_bolder == 1
    call s:h("Statement", {"fg": s:green, "gui": "bold"})
    call s:h("PreProc",   {"fg": s:bluez, "gui": "bold"})
else
    call s:h("Statement", {"fg": s:green})
    call s:h("PreProc",   {"fg": s:bluez})
endif

" Change
" call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("LineNr",        {"fg": s:medium_gray})
