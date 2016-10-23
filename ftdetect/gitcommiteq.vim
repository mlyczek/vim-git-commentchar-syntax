"
" Detects if the git commit file is opened and has equal sign (=)
" as commentChar and applies proper syntax colors.
"
" Author: mlyczek

function! s:DetectGitCommitEq()
    let n = 1
    while n < 10 && n < line("$")
        if getline(n) =~ '^= Changes to be committed'
            set syntax=gitcommiteq
            return
        endif
        let n = n + 1
    endwhile
endfunction

au BufNewFile,BufRead COMMIT_EDITMSG call s:DetectGitCommitEq()

