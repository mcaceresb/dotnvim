" Base colors let s:base03  = {'t': s:ansi_colors ?   8 : (s:tty ? '0' : 234), 'g': '#1C1C1C'}
let s:base02  = {'t': s:ansi_colors ? '0' : (s:tty ? '0' : 236), 'g': '#303030'} " Middle background
let s:base01  = {'t': s:ansi_colors ?  10 : (s:tty ? '0' : 250), 'g': '#C0CADA'} " Middle foreground
let s:base00  = {'t': s:ansi_colors ?  11 : (s:tty ? '7' : 241), 'g': '#626262'} " Second level background
let s:base0   = {'t': s:ansi_colors ?  12 : (s:tty ? '7' : 244), 'g': '#808080'}
let s:base1   = {'t': s:ansi_colors ?  14 : (s:tty ? '7' : 245), 'g': '#8A8A8A'} " First level background
let s:base2   = {'t': s:ansi_colors ?   7 : (s:tty ? '7' : 254), 'g': '#E4E4E4'} " Second level foreground
let s:base3   = {'t': s:ansi_colors ?  15 : (s:tty ? '7' : 7  ), 'g': '#FFFFFF'} " First level foreground
