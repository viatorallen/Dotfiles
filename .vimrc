" --- 基礎設定 ---
set nocompatible      " 關閉與 vi 的相容模式 (建議啟用)
syntax on             " 開啟語法高亮
set encoding=utf-8    " 設定編碼
set fileencodings=utf-8,ucs-bom,cp950,gbk,latin1 " 檔案編碼識別

" --- 界面與顯示 ---
set number            " 顯示絕對行號
set relativenumber    " 顯示相對行號 (切換行更方便)
set cursorline        " 高亮當前行
set ruler             " 顯示右下角資訊
set nowrap            " 文字過長不換行
set showmode          " 左下角顯示當前模式
set showcmd           " 顯示未完成的指令

" --- 搜尋與縮排 ---
set hlsearch          " 高亮搜尋結果
set incsearch         " 搜尋時關鍵字即時顯現
set ignorecase        " 搜尋時忽略大小寫
set smartcase         " 若搜尋字串包含大寫，則區分大小寫
set ai                " 自動對齊縮排
set si                " 智慧縮排 (Smart indent)

" --- Tab 與空白鍵 ---
set tabstop=4         " Tab 佔用 4 個空格寬度
set shiftwidth=4      " 縮排時寬度
set expandtab         " 將 Tab 自動轉換為空白
set backspace=indent,eol,start " 修正 backspace 鍵行為

" --- 滑鼠與功能 ---
set mouse=r           " 啟用所有模式下的滑鼠支援
set history=1000      " 保留 1000 個歷史指令
set noswapfile        " 關閉交換檔 (不產生 .swp 檔)

" --- 配色 ---
set background=dark   " 設定暗色背景

" --- 設定剪貼 ---
silent! set clipboard=unnamedplus

" 定義一個專門發送 OSC 52 的函式
function! Osc52Yank(text)
    if executable('base64')
        let b64 = system('base64 | tr -d "\n"', a:text)
        let osc = "\e]52;c;" . b64 . "\x07"
        call writefile([osc], '/dev/tty', 'b')
    endif
endfunction

" 針對 Visual Mode 的映射
" 當你在 v 模式選好按 y，它會先 yank，然後把選取區內容傳給函式
vnoremap y y:call Osc52Yank(getreg('"'))<CR>

noremap <ESC><ESC> :nohlsearch<CR>
