 
augroup stata
	" Set a soft limit at 80 columns (as with Stata's do file editor) - /se/356
	if g:vimforstata_set_column != 0
        au BufRead,BufEnter,BufNewFile *.do setlocal colorcolumn=80

	" Set a hard limit at 120 columns - /se/356 - DISABLED - Will make this available as an optional command in the future.
	"let &colorcolumn="80,".join(range(120,999),",")
augroup END
