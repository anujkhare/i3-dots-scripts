let mapleader=","
set hlsearch
set incsearch
set nu
set autoindent
syntax on
set tabstop=2
set expandtab
" color custom
set tw=79

set foldmethod=syntax   
set foldnestmax=10
set nofoldenable
set foldlevel=0
let c_no_comment_fold = 1
nnoremap <Space> za

" For latex!
abbr beta \beta
abbr alpha \alpha
abbr lamb \lambda
abbr beq \begin{equation}
abbr eeq \end{equation}
abbr theta \theta

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" To remove trailing whitespace and return cursor to location
function! RemoveTrailingWhite()
  call Preserve('%s/\s\+$//g')
endfunction

" For removing trailing whitespaces automatically
" autocmd BufWritePre <buffer> call RemoveTrailingWhite()

autocmd Filetype python setlocal ts=4 sts=4 sw=4
au BufNewFile *.cpp 0r ~/.vim/template.cpp
" highlight bad whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" TODO: Dictionary!
"
" Match NOTE like TODO
syn match   myNote   contained   "\<\(NOTE\):"
hi def link myNote Todo

" PLUGINS CONFIG
execute pathogen#infect() 

"" see :h NERDTreeMappings for list of mappings
"" automatically start NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" Control + n for nerdtree
"map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

"" Nerdtree-git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Ack.vim
cnoreabbrev Ack Ack!
noremap <Leader>a :Ack! <cword><cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" python style guide!
autocmd BufWritePost *.py call Flake8()

abbr gd GoDoc

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

"" enable filetype plugin
filetype plugin on

" au Filetype go nnoremap <leader>hv :vsp <CR>:exe "GoDef" <CR>
" au Filetype go nnoremap <leader>hs :sp <CR>:exe "GoDef"<CR>
" au Filetype go nnoremap <leader>ht :tab split <CR>:exe "GoDef"<CR>

"" PLUGINS INSTALLED:
"" REMEMBER TO RUN :HELPTAGS TO GENERATE HELP TAGS!
"" Pathogen plugin manager

"" nerdtree, git-nerdtree
"" fugitive - git integration to vim !

"" airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2
" AirlineToggleWhitespace

"" NERDCOMMENTER

"" ctags, cscope
"" Ack.vim

"" vim-go and associated stuff
" format with goimports instead of gofmt - MAKES IT SLOW!
"" godef

"" interesting commands I forget:
"" :tab sball -> open all open buffers in separate tabs


"" For sync look at:
"" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
