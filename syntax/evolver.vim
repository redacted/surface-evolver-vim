" Vim syntax file
" Language:	Surface evolver	
" Original author: muwn <muwn.gu@gmail.com>   
" Last Change:	2 Oct. 2007

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword suevStatement		return
syn keyword suevLabel			case switch
syn keyword suevConditional		else elseif end if otherwise then
syn keyword suevRepeat		do for while foreach

syn keyword suevTodo			contained  TODO

" If you do not want these operators lit, uncommment them and the "hi link" below
syn match suevArithmeticOperator	"[-+]"
syn match suevArithmeticOperator	"\.\=[*/\\^]"
syn match suevRelationalOperator	"[=~]="
syn match suevRelationalOperator	"[<>]=\="
syn match suevLogicalOperator		"[&|~]"

syn match suevLineContinuation	"\.\{3}"

"syn match suevIdentifier		"\<\a\w*\>"

" String
syn region suevString			start=+'+ end=+'+	oneline

" If you don't like tabs
syn match suevTab			"\t"

" Standard numbers
syn match suevNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match suevFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match suevFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Transpose character and delimiters: Either use just [...] or (...) aswell
syn match suevDelimiter		"[][]"
"syn match suevDelimiter		"[][()]"
syn match suevTransposeOperator	"[])a-zA-Z0-9.]'"lc=1

syn match suevSemicolon		";"

syn match suevComment			"//.*$"	contains=suevTodo,suevTab
syn region suevcomment			start="/\*" end="\*/"	oneline


syn keyword suevIdentifier	color fixed constraints volume density  pressure  no_refine local
syn keyword suevOperator	read vertices edges faces bodies	

syn keyword suevFunction	parameter tension gravity constraint boundary optimizing_parameter gravity_constant quantity define  printf

syn keyword suevImplicit		abs acos atan asin cos cosh exp log prod sum
syn keyword suevImplicit		log10 max min sign sin sqrt tan reshape

syn match suevError	"-\=\<\d\+\.\d\+\.[^*/\\^]"
syn match suevError	"-\=\<\d\+\.\d\+[eEdD][-+]\=\d\+\.\([^*/\\^]\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_suev_syntax_inits")
  if version < 508
    let did_suev_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink suevTransposeOperator	suevOperator
  HiLink suevOperator		Operator
  HiLink suevLineContinuation	Special
  HiLink suevLabel			Label
  HiLink suevConditional		Conditional
  HiLink suevRepeat			Repeat
  HiLink suevTodo			Todo
  HiLink suevString			String
  HiLink suevDelimiter		Identifier
  HiLink suevIdentifier		Identifier
  HiLink suevTransposeOther		Identifier
  HiLink suevNumber			Number
  HiLink suevFloat			Float
  HiLink suevFunction		Function
  HiLink suevError			Error
  HiLink suevImplicit		suevStatement
  HiLink suevStatement		Statement
  HiLink suevSemicolon		SpecialChar
  HiLink suevComment			Comment
  HiLink suevcomment			Comment

  HiLink suevArithmeticOperator	suevOperator
  HiLink suevRelationalOperator	suevOperator
  HiLink suevLogicalOperator		suevOperator

"optional highlighting
  "HiLink suevIdentifier		Identifier
  "HiLink suevTab			Error

  delcommand HiLink
endif

let b:current_syntax = "suev"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
