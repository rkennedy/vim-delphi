" Vim syntax file
" Language: Delphi
" Maintainer: Rob Kennedy <kennedyri@gmail.com>

if exists("b:current_syntax")
    finish
endif

syn case ignore

syn match delphiAsm "\v<asm>"
syn keyword delphiReservedWord end array begin dispinterface finalization goto implementation inherited initialization label of packed set type uses with
syn keyword delphiReservedWord constructor destructor function operator procedure property
syn keyword delphiReservedWord const out threadvar var

syn keyword delphiLoop for to downto while repeat until do
" TODO handle `of` conditionally: "case..of" is conditional; "array of" isn't
syn keyword delphiConditional if then case else
syn keyword delphiExcept try finally except on raise at
syn keyword delphiStructure class interface object record

syn keyword delphiCallingConv cdecl pascal register safecall stdcall winapi
syn keyword delphiDirective library package program unit
syn keyword delphiDirective absolute abstract assembler delayed deprecated dispid dynamic experimental export external final forward implements inline name message overload override packed platform readonly reintroduce static unsafe varargs virtual writeonly
syn keyword delphiDirective helper reference sealed
syn keyword delphiDirective "contains" requires
syn keyword delphiDirective far near resident
syn keyword delphiVisibility private protected public published strict

syn keyword delphiPropDirective default index nodefault read stored write

syn match delphiIdentifier "\v\&?[a-z_]\w*"

syn keyword delphiNil nil
syn keyword delphiBool true false
syn keyword delphiPredef result self
syn keyword delphiAssert assert

syn match delphiOperator "\v\+|-|\*|/|\@|\=|:\=|\<|\<\=|\>|\>\=|<>|\.\."
syn match delphiOperator "\v\(|\)|\[|\]|,|\.|\;|\:"
syn keyword delphiOperator and as div in is mod not or shr shl xor

syn region delphiComment start="{" end="}"
syn region delphiComment start="(\*" end="\*)"
syn region delphiComment start="//" end="$" oneline
syn region delphiDefine start="{\$" end="}"
syn region delphiDefine start="(\*\$" end="\*)"

syn keyword delphiWindowsType bool dword ulong
syn match delphiWindowsType "\v<h(dc|result|wnd)>"
syn match delphiType "\v<(byte|word|long)bool>"
syn keyword delphiType boolean
syn match delphiType "\v<(short|small|long|nativeu?)int>"
syn match delphiType "\v<u?int(8|16|32|64|128)>"
syn match delphiType "\v<(long)?word>"
syn keyword delphiType byte integer cardinal pointer
syn keyword delphiType single double extended comp currency
syn match delphiType "\v<real(48)?>"
syn match delphiType "\v<(ansi|wide)?char>"
syn match delphiType "\v<(ansi|wide|unicode|short)?string>"
syn match delphiType "\v<(ole)?variant>"
" Let's define a type as being anything that starts with a capital E, I, P, or
" T, has a capital second letter, and has some lowercase letter. We require
" the capital second letter to exclude variable and function names that happen
" to start with E, I, P, or T, and we require the lowercase letter to exclude
" translated macros and abbreviations that just happen to be in all caps. It's
" not perfect, but it's a good approximation in the absence of a symbol table.
syn match delphiType "\v\C[IPTE][A-Z]\w*[a-z]\w*"

syn match delphiInteger "\v[-+]?\$[0-9a-f]+"
syn match delphiInteger "\v[-+]?\d+"
syn match delphiReal "\v[-+]?\d+\.\d*(e[-+]?\d+)?"
syn match delphiReal "\v[-+]?\.\d+(e[-+]?\d+)?"
syn match delphiReal "\v[-+]?\d+e[-+]?\d+"

syn region delphiString start="'" end="'" skip="''" oneline
syn match delphiChar "\v\#\d+"
syn match delphiChar "\v\#\$[0-9a-f]{1,6}"

syn region delphiAsmBlock start="\v<asm>" end="\v<end>" contains=delphiComment,delphiAsm keepend

syn match delphiBadChar "\v\%|\?|\\|\!|\"|\||\~"

hi def link delphiComment Comment
hi def link delphiType Type
hi def link delphiWindowsType Type
hi def link delphiReservedWord Keyword
hi def link delphiAsm Keyword
hi def link delphiInteger Number
hi def link delphiReal Float
hi def link delphiDefine PreProc
hi def link delphiString String
hi def link delphiChar Character
"hi def link delphiIdentifier Identifier
hi def link delphiOperator Operator
hi def link delphiNil Constant
hi def link delphiBool Identifier "Boolean
hi def link delphiPredef Special
hi def link delphiAssert Debug
hi def link delphiLoop Repeat
hi def link delphiConditional Conditional
hi def link delphiExcept Exception
hi def link delphiBadChar Error
hi def link delphiVisibility StorageClass
hi def link delphiCallingConv StorageClass
hi def link delphiDirective StorageClass
hi def link delphiPropDirective StorageClass
hi def link delphiStructure Structure

let b:current_syntax = "delphi"
