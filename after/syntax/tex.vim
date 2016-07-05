syn match texMathSymbol '\\lor\>'  contained conceal cchar=∨
syn match texMathSymbol '\\land\>' contained conceal cchar=∧
syn match texMathSymbol '\\lnot\>' contained conceal cchar=¬

syn match NegeFull '\\NEGE\>' contains=NegeHead,NegeTail 
syn match NegeHead '\\NEG\>'  cchar=¬ containedin=NegeFull contained
syn match NegeTail 'E'        cchar=E containedin=NegeFull contained
