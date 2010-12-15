" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=dark               " Background.
set lines=90 columns=114         " Window dimensions.

set guioptions-=r                 " Don't show right scrollbar
set guioptions-=L                 " Don't show left scrollbar

colorscheme railscasts
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬
