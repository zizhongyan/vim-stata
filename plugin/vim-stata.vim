
" Vim to Stata  
"==============================================================================
"Script Description: Run selected do-file in Stata from Vim
"Script Platform: OS X and Stata 12,13,14
"Script Version: 1.0.2 Beta
"Last Edited: 2nd December 2015
"Authors: Zizhong Yan (coding) & Chuhong Wang (testing & debugging)
"Contacts: helloyzz@gmail.com
"Configurations:
"		1, Installation
"               1.1. Put "vim2stata.vim"(this file) to dir vimfiles/plugin or vim74/plugin
"               2.2. use Vim Pathogen or Vundle plugin to install it from git repository. 
"       2, To ensure that the do-files are opened in the Stata by default and hence are executed
"          directly, we need to make the following two changes.
"               2.1. Uncheck the "Edit do-files opened from the Finder in Do-file Editor"
"                       in Preference>General Preference>Windows>Do-file Editor>Advanced
"                       (Stata 13/14), or Preferences > Do-file Editor > Advanced (Stata 12).
"               2.2. Ensure the do-files are opened in the Stata by default. If it is not,
"               please:
"                        Right click on any do-file under Finder > Open With > Select Stata from
"                        Applications folder > check "Always Open With" > Open.
"       3, Hotkey binding (optional)
"          The hotkey for executing selected codes is set to be F9.
"          Please note that you could customise your hotkey by adding a sentence to your .vimrc
"          or vimrc, for example:
"               :vmap <C-S-x> :<C-U>call RunDoLines()<CR><CR>
"          Then the hotkey would be changed to Ctrl+Shift+X
"       4, Restart the Vim and click F9 or the customised hotkey to run the
"          selected codes.
"Background information:
"       1, This plugin is motivated by the article "Some notes on text editors for Stata
"          users"  (http://fmwww.bc.edu/repec/bocode/t/textEditors.html#vim).
"          This plugin basically creates a temporary do-file, which is then sent to the 
"		   Stata to execute.
"          The Stata13+ has introduced the AppleScript commands (i.e. DoCommand and 
"		   DoCommandAsync) which allows script commands to directly enter the Stata without
"		   creating any temporary file. However, we did not consider this option for two 
"		   reasons:
"			i) AppleScript commands will go through all selected commands anyways even if 
"			the Stata has already reported an error message. This behaves quite differently
"			from the Stata in-built do-file editor and could probably cause mistakes.
"			ii) AppleScript commands sometimes do not work properly based on our own experience 
"			and tests, though we have not figured out the reason so far. Therefore we believe that 
"			creating a temporary do-file would be safer and more reliable and it behaves exactly 
"			the same as what the in-built do-file editor does. The temp file is harmless since it 
"			has just been temporarily saved in a cache folders in the OS X.
"       2, For Windows users, please follow the instructions in the webpage above.
"       3, This plugin has been tested on Mac OS X Yosemite and El Capitan and supports 
"          Stata 12-14SE/MP/IC. (It should also work well with Stata 11, but has not been formally 
"          tested)
"==============================================================================


 
fun! RunDoLines()
let selectedLines = getbufline('%', line("'<"), line("'>"))
if col("'>") < strlen(getline(line("'>")))
let selectedLines[-1] = strpart(selectedLines[-1], 0, col("'>"))
endif
if col("'<") != 1
let selectedLines[0] = strpart(selectedLines[0], col("'<")-1)
endif
let temp_dofile = tempname() . ".do"  
call writefile(selectedLines, temp_dofile)
python << EOF
import vim
import sys
import os  
def run_yan(): 
    temp_dofile = vim.eval("temp_dofile")
    print(temp_dofile)  
    cmd = """osascript -e 'tell application "Finder" to open POSIX file "{0}"' -e 'tell application "{1}" to activate' &""".format(temp_dofile, "MacVim") 
    os.system(cmd) 
run_yan()
EOF
endfun

noremap  <Plug>(RunDoLines)            :<C-U>call RunDoLines()<CR><CR>
map  <buffer> <silent> <F9>          <Plug>(RunDoLines)
"command! Vim2StataToggle call RunDoLines()<CR><CR>
 
