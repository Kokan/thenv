set nu
set ff=unix
color desert

nmap <silent> <C-g> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set completeopt-=preview
