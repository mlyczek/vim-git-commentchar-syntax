"
" Vim syntax for git commit file with commentChar being equal sign (=)
" Uses default vim syntax file so depends very heavily on match groups
" defined there.
"
" Author: mlyczek
"

if exists("b:current_syntax")
  finish
endif

runtime! syntax/gitcommit.vim
unlet b:current_syntax

syn clear gitcommitBlank
syn match   gitcommitBlank	"^[^=].*" contained contains=@Spell
syn clear gitcommitFirstLine
syn match   gitcommitFirstLine	"\%^[^=].*"  nextgroup=gitcommitBlank skipnl
syn clear gitcommitComment
syn match   gitcommitComment	"^=.*"
syn clear gitcommitHead
syn match   gitcommitHead	"^\%(=   .*\n\)\+=$" contained transparent
syn clear gitcommitOnBranch
syn match   gitcommitOnBranch	"\%(^= \)\@<=On branch" contained containedin=gitcommitComment nextgroup=gitcommitBranch skipwhite
syn clear gitcommitNoBranch
syn match   gitcommitOnBranch	"\%(^= \)\@<=Your branch .\{-\} '" contained containedin=gitcommitComment nextgroup=gitcommitBranch skipwhite

syn match   gitcommitNoBranch	"\%(^= \)\@<=Not currently on any branch." contained containedin=gitcommitComment
syn clear gitcommitHeader
syn match   gitcommitHeader	"\%(^= \)\@<=.*:$"	contained containedin=gitcommitComment
syn clear gitcommitAuthor
syn region  gitcommitAuthor	matchgroup=gitCommitHeader start=/\%(^= \)\@<=\%(Author\|Committer\):/ end=/$/ keepend oneline contained containedin=gitcommitComment transparent
syn clear gitcommitNoChanges
syn match   gitcommitNoChanges	"\%(^= \)\@<=No changes$" contained containedin=gitcommitComment

syn clear gitcommitUntracked
syn region  gitcommitUntracked	start=/^= Untracked files:/ end=/^=$\|^=\@!/ contains=gitcommitHeader,gitcommitHead,gitcommitUntrackedFile fold

syn clear gitcommitDiscarded
syn region  gitcommitDiscarded	start=/^= Change\%(s not staged for commit\|d but not updated\):/ end=/^=$\|^=\@!/ contains=gitcommitHeader,gitcommitHead,gitcommitDiscardedType fold
syn clear gitcommitSelected
syn region  gitcommitSelected	start=/^= Changes to be committed:/ end=/^=$\|^=\@!/ contains=gitcommitHeader,gitcommitHead,gitcommitSelectedType fold
syn clear gitcommitUnmerged
syn region  gitcommitUnmerged	start=/^= Unmerged paths:/ end=/^=$\|^=\@!/ contains=gitcommitHeader,gitcommitHead,gitcommitUnmergedType fold

syn clear gitcommitWarning
syn match   gitcommitWarning		"\%^[^=].*: needs merge$" nextgroup=gitcommitWarning skipnl
syn match   gitcommitWarning		"^[^=].*: needs merge$" nextgroup=gitcommitWarning skipnl contained
syn match   gitcommitWarning		"^\%(no changes added to commit\|nothing \%(added \)\=to commit\)\>.*\%$"

let b:current_syntax = "gitcommiteq"
