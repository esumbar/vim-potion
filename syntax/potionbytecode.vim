if exists("b:current_syntax")
    finish
endif

syntax keyword potionbytecodeKeyword getupval getlocal mult
syntax keyword potionbytecodeKeyword setupval return loadpn
syntax keyword potionbytecodeKeyword setlocal move loadk
syntax keyword potionbytecodeKeyword msg proto call bind self
syntax keyword potionbytecodeKeyword code assign expr block
syntax keyword potionbytecodeKeyword times value list

syntax keyword potionbytecodeBoolean nil

syntax match potionbytecodeComment "\v\;.*$"
syntax match potionbytecodeType "\v^\.\w+"

highlight link potionbytecodeKeyword Keyword
highlight link potionbytecodeBoolean Boolean
highlight link potionbytecodeComment Comment
highlight link potionbytecodeType Type

let b:current_syntax = "potionbytecode"
