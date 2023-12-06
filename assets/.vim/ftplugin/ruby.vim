function! s:Run()
	execute "! clear && ruby %"
endfunction

function! s:AocTestLast()
	execute "! clear && aoc test-last"
endfunction

function! s:AocTestAll()
	execute "! clear && aoc test-all"
endfunction

function! s:AocRunLast()
	execute "! clear && aoc run-last"
endfunction

function s:AocTestStar()
	execute "! clear && aoc test-star 12 1"
endfunction

function s:AocRunStar()
	execute "! clear && aoc run-star 12 1"
endfunction

nnoremap <localleader>r :call <sid>Run()<cr>

nnoremap <localleader>at :call <sid>AocTestLast()<cr>
"nnoremap <localleader>at :call <sid>AocTestStar()<cr>
nnoremap <localleader>aT :call <sid>AocTestAll()<cr>
nnoremap <localleader>ar :call <sid>AocRunLast()<cr>
"nnoremap <localleader>ar :call <sid>AocRunStar()<cr>

set autoindent
