set nu
set cursorline
set mouse=a
set selection=exclusive
set tabstop=4
syntax on "自动语法高亮






autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
func SetTitle()
"如果文件类型为.sh文件 
if &filetype == 'sh' 
call setline(1,"\#########################################################################")
call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: huyang")
        call append(line(".")+2, "\# mail: huyang1996@qq.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: huyang")
        call append(line(".")+2, "    > Mail: huyang1996@qq.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
endif
autocmd BufNewFile * normal G
endfunc
