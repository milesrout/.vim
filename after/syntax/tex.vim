syn match texMathSymbol '\\lor\>'  contained conceal cchar=∨
syn match texMathSymbol '\\land\>' contained conceal cchar=∧
syn match texMathSymbol '\\lnot\>' contained conceal cchar=¬

syn match texMathSymbol '\\NEGE\>' contains=NegeiHead,NegeTail
syn match texMathSymbol '\\NEGI\>' contains=NegeiHead,NegiTail
syn match NegeiHead '\\NEG' conceal cchar=¬ containedin=texMathSymbol contained
syn match NegeTail 'E'      conceal cchar=E containedin=texMathSymbol contained
syn match NegiTail 'I'      conceal cchar=I containedin=texMathSymbol contained

syn match texMathSymbol '\\DISJE\>' contains=DisjeiHead,DisjeTail
syn match texMathSymbol '\\DISJI\>' contains=DisjeiHead,DisjiTail
syn match DisjeiHead '\\DISJ' conceal cchar=∨ containedin=texMathSymbol contained
syn match DisjeTail 'E'       conceal cchar=E containedin=texMathSymbol contained
syn match DisjiTail 'I'       conceal cchar=I containedin=texMathSymbol contained

syn match texMathSymbol '\\CONJE\>' contains=ConjeiHead,ConjeTail
syn match texMathSymbol '\\CONJI\>' contains=ConjeiHead,ConjiTail
syn match ConjeiHead '\\CONJ' conceal cchar=∧ containedin=texMathSymbol contained
syn match ConjeTail 'E'       conceal cchar=E containedin=texMathSymbol contained
syn match ConjiTail 'I'       conceal cchar=I containedin=texMathSymbol contained

syn match texMathSymbol '\\IMPLE\>' contains=ImpleiHead,ImpleTail
syn match texMathSymbol '\\IMPLI\>' contains=ImpleiHead,ImpliTail
syn match ImpleiHead '\\IMPL' conceal cchar=→ containedin=texMathSymbol contained
syn match ImpleTail 'E'       conceal cchar=E containedin=texMathSymbol contained
syn match ImpliTail 'I'       conceal cchar=I containedin=texMathSymbol contained
