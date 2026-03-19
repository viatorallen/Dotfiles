" --- 基礎與編碼 ---
set nocompatible
syntax on
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp950,gbk,latin1

" --- 界面顯示 ---
set number
set relativenumber
set cursorline
set ruler
set nowrap
set showmode
set showcmd
set background=dark

" --- 搜尋與縮排 ---
set hlsearch
set incsearch
set ignorecase
set smartcase
set ai
set si
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

" --- 功能設定 ---
set mouse=r
set history=1000
set noswapfile
silent! set clipboard=unnamedplus

" --- OSC 52 跨平台剪貼簿 ---
function! Osc52Yank(text)
    if executable('base64')
        let b64 = system('base64 | tr -d "\n"', a:text)
        let osc = "\e]52;c;" . b64 . "\x07"
        call writefile([osc], '/dev/tty', 'b')
    endif
endfunction

vnoremap y y:call Osc52Yank(getreg('"'))<CR>
noremap <ESC><ESC> :nohlsearch<CR>
