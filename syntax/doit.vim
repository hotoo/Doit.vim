if exists("b:current_syntax")
  finish
endif

syn match   taskPrefix	display "^\s*[*#-][! ~]\[.\]"
syn match   taskPrefix	display "^\s*\* \[ \]"
syn match   taskTime	display "|T:\(\d\{4}\-\d\{2}\-\d\{2}.*\)|"
syn match   taskID	    conceal "#ID:.*#"
syn match   taskTags	display "#.*\s"
syn region  taskItem	start="\* \[.\]" end="$" contains=taskTodo,taskPrefix,taskTime,taskID,@Spell
"syn region  taskImportant	start="^\s*[\*#-]!\[.\]" skip="\n^\s*[^*#-].*" end="$" contains=taskTodo,taskPrefix,@Spell
syn region  taskImportant	start="^\s*[\*#-]!\[.\]" end="$" contains=taskTodo,taskPrefix,taskTime,@Spell
syn region  taskLower	start="^\s*\*\~\[.\]" end="$" contains=taskTodo,taskPrefix,taskTime,@Spell
syntax region taskDone start="^\s*\*.\[X\]" end="$" contains=taskTodo,taskTime,@Spell

hi def link taskPrefix		Special

hi def link taskDone		Comment
"hi taskDone		guifg=#555555

hi def link taskTime		Comment
"hi def link taskTime		Structure

hi taskID		guifg=#555555
hi def link taskTags		Tag

"hi def link taskItem		Statement

"hi taskLower	guifg=gray
hi def link taskLower		Statement

"hi def link taskImportant	Identifier
"hi def link taskImportant	Directory
hi taskImportant	guifg=gold

let b:current_syntax = "task"
