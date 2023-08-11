" short forms for latex formatting and math elements. {{{
" taken from auctex.vim or miktexmacros.vim
imap ... \ldots
imap " "<s-space>
imap () ()<s-space>
imap [] []<s-space>
imap {} {}<s-space>
imap __ _<s-space>
imap ^^ ^<s-space>
imap $$ $<s-space>
inoremap ~~ \approx
inoremap :: \dots
exec 'imap '.g:Tex_Leader.'^ hat<s-space>'
exec 'imap '.g:Tex_Leader.'_ bar<s-space>'
exec 'imap '.g:Tex_Leader.'6 \partial'
exec 'imap '.g:Tex_Leader.'8 \infty'
exec 'imap '.g:Tex_Leader.'@ \circ'
exec 'imap '.g:Tex_Leader.'0 ^\circ'
exec 'imap '.g:Tex_Leader.'= \equiv'
exec 'imap '.g:Tex_Leader.'\ \setminus'
exec 'imap '.g:Tex_Leader.'. \cdot'
exec 'imap '.g:Tex_Leader.'* \times'
exec 'imap '.g:Tex_Leader.'& \wedge'
exec 'imap '.g:Tex_Leader.'- \bigcap'
exec 'imap '.g:Tex_Leader.'+ \bigcup'
exec 'imap '.g:Tex_Leader.'( \subset'
exec 'imap '.g:Tex_Leader.') \supset'
exec 'imap '.g:Tex_Leader.'< \le'
exec 'imap '.g:Tex_Leader.'> \ge'
exec 'imap '.g:Tex_Leader.''' \prime'
exec 'imap '.g:Tex_Leader.'2 sq<s-space>'
" }}}
" Greek Letters {{{
exec 'imap '.g:Tex_Leader.'a \alpha'
exec 'imap '.g:Tex_Leader.'b \beta'
exec 'imap '.g:Tex_Leader.'c \chi'
exec 'imap '.g:Tex_Leader.'d \delta'
exec 'imap '.g:Tex_Leader.'e \varepsilon'
exec 'imap '.g:Tex_Leader.'f \varphi'
exec 'imap '.g:Tex_Leader.'g \gamma'
exec 'imap '.g:Tex_Leader.'h \eta'
exec 'imap '.g:Tex_Leader.'i \iota'
exec 'imap '.g:Tex_Leader.'k \kappa'
exec 'imap '.g:Tex_Leader.'l \lambda'
exec 'imap '.g:Tex_Leader.'m \mu'
exec 'imap '.g:Tex_Leader.'n \nu'
exec 'imap '.g:Tex_Leader.'p \pi'
exec 'imap '.g:Tex_Leader.'q \theta'
exec 'imap '.g:Tex_Leader.'r \rho'
exec 'imap '.g:Tex_Leader.'s \sigma'
exec 'imap '.g:Tex_Leader.'t \tau'
exec 'imap '.g:Tex_Leader.'u \upsilon'
exec 'imap '.g:Tex_Leader.'v \varsigma'
exec 'imap '.g:Tex_Leader.'w \omega'
exec 'imap '.g:Tex_Leader.'x \xi'
exec 'imap '.g:Tex_Leader.'y \psi'
exec 'imap '.g:Tex_Leader.'z \zeta'
" not all capital greek letters exist in LaTeX!
" reference: http://www.giss.nasa.gov/latex/ltx-405.html
exec 'imap '.g:Tex_Leader.'D \Delta'
exec 'imap '.g:Tex_Leader.'F \Phi'
exec 'imap '.g:Tex_Leader.'G \Gamma'
exec 'imap '.g:Tex_Leader.'Q \Theta'
exec 'imap '.g:Tex_Leader.'L \Lambda'
exec 'imap '.g:Tex_Leader.'X \Xi'
exec 'imap '.g:Tex_Leader.'Y \Psi'
exec 'imap '.g:Tex_Leader.'S \Sigma'
exec 'imap '.g:Tex_Leader.'U \Upsilon'
exec 'imap '.g:Tex_Leader.'W \Omega'
" }}}
