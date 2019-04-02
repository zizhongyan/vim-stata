# Vim Plugin for Running Selected Do-File Lines in Stata

With this plugin, you can replace Stata's DO file editor with Vim, running do file commands directly from Vim.

Vim is known as a highly configurable text editor built to enable efficient text editing, and Stata is one of the most popular statistical packages with a huge user-community. This plugin (beta) is developed to make connections between Vim and Stata and supports Mac OS X and Linux. With our plugin, you could easily send selected do file lines from Vim to have them run in Stata. To the best of our knowledge, this is probably the first plugin to link Vim and Stata under Unix-like platforms. (For Windows users, please refer to the information in the last section). Please feel free to let us know if you have any comments or suggestions.

## Updates
**Linux Support**: This update adds support for Linux systems to run Do file lines. Edits to the plugin were made by [Isaac M. E. Dodd](https://github.com/IsaacDodd/).
(Last edited on 01 Apr 2019 by [I Dodd](https://github.com/IsaacDodd/))

**Syntax highlighting**: This update enables the Stata syntax highlighting in Vim. An updated and enhanced Stata syntax file has been included (based on Jeffrey Pitblado's Stata syntax file). (Thanks for William Buchanan's suggestion.)
(Last edited on 29 Feb 2016 by [Z Yan](mailto:helloyzz@gmail.com) and [C Wang](mailto:flora7819@gmail.com) )

## Configurations:

### 1, Installation Options

1.1. **Manual Installation**: Put `vim-stata.vim` (the plugin file) directly into your Vim directory. In Windows or MacOS this is either `vimfiles/plugin` or `vim81/plugin`. In Linux, this is `.vim`

1.2. **Package/Plugin Managers**: Or use the plugins [Vim-Plug](https://github.com/junegunn/vim-plug), [Vundle](https://github.com/VundleVim/Vundle.vim), or [pathogen.vim](https://github.com/tpope/vim-pathogen) to install it from the git repository.

### 2, To ensure that the do-files open in Stata by default and hence are executed directly, we need to make the following two changes.

Ensure the do-files are opened in Stata by default. If it is not, please right click on any do-file and set the OS to always open the do-file in Stata by the following:

a. On **Windows**: choose 'Open With', select Stata, and choose 'Always open'

b. On **MacOS**: under Finder > Open With > Select Stata from Applications folder > check "Always Open With" > Open.
Also, uncheck the "Edit do-files opened from the Finder in Do-file Editor" in Preference>General Preference>Windows>Do-file Editor>Advanced (Stata 13/14), or Preferences > Do-file Editor > Advanced (Stata 12).

c. On **Linux KDE**: choose 'Open With', Select Other Application, then choose Stata and check "Remember application association"


### 3, Settings Configuration (Required for Linux Users)

For linux distributions, the following additional settings configuration in your .vimrc file is needed:

#### Required Setup Steps

For **Linux** users, you have to let the plugin know where your Stata binary lives (which should a binary located in a directory that is in your `$PATH` variable). To determine where your Stata binary is, open a terminal and enter `which stata`. Then, copy the path it prints out into the variable below. In your `.vimrc` file, paste the path into 1 of the following two variable definitions:

```
" Path to Stata - Set either one of these but not both. Paste in the path with the executable filename
"	Example: On Linux, /usr/local/stata15/xstata for Stata 15
" -- Option (1): Path to the Stata binary (including the executable name)
let g:vimforstata_pathbin = "/usr/local/stata15/xstata"
```
Or:
```
" -- Option (2): Path to a shell script with code that runs Stata
let g:vimforstata_pathbin_sh = "~/Scripts/stata.sh"
```

A standard installation of Stata on Linux comes with different executable options (stata, xstata, stata-sm, stata-se, stata-mp, etc.). Usually for a Linux installation, `/stata` is the console version and `/xstata` is the GUI version. Enter in the one that's appropriate to your installation and license.

The shell script variable option allows you to specify a .sh file that launches Stata when called (plus any other automating functions you want to put in the script, such as to save a copy of the lines you run in the do file somewhere else). Just make sure that your shell script takes arguments and passes it to the executable you specify appropriately. For the bang you can use the launcher available for your Linux distribution's desktop environment (e.g., gvfs-open for Gnome users, xdg-open for other desktop environments, or gtk-launch as a last result). 

Here is a basic example using gtk-launch in a file located at ~/Scripts/stata.sh as in the above sample variable for a stata15 binary located in the usr/local $PATH directory:

```Bash
#!/usr/bin/env gtk-launch

/usr/local/stata15/xstata $@
```


### 4, Hotkey binding (optional)
The hotkey for executing selected codes is set to be `F9`.

Please note that you could customise your hotkey by simply adding a sentence to your .vimrc or vimrc, for example:


	" Select Do file lines (with v or V) and run them with Ctrl+Shift+X
	:vmap <C-S-x> :<C-U>call RunDoLines()<CR><CR>

Then the hotkey would be changed to `Ctrl+Shift+X`

### 5, Column Line (optional)

The Stata do file editor puts a helpful line at the 80th column to let the user know when the lines they're coding are getting too long. By default this is turned on for any .do file. Feel free to turn this OFF with the following setting:

	" Turn off the 80th column line
	let g:vimforstata_set_column == 0

### 5, Restart the Vim and hit `F9` or the customised hotkey to run the selected codes.

## Background information:
1. This plugin is motivated by the article ["Some notes on text editors for Stata users"](http://fmwww.bc.edu/repec/bocode/t/textEditors.html#vim).

This plugin basically creates a temporary do-file, which is then sent to the Stata to execute.
The Stata13+ has introduced the AppleScript commands (i.e. DoCommand and DoCommandAsync) which allows script commands to directly enter the Stata without creating any temporary file. However, we did not consider this option for two reasons:
 		   
i) AppleScript commands will go through all selected commands anyways even if the Stata has already reported an error message. This behaves quite differently from the Stata in-built do-file editor and could probably cause mistakes.
 		
ii) AppleScript commands sometimes do not work properly based on our own experience and tests, though we have not figured out the reason so far. Therefore we believe that creating a temporary do-file would be safer and more reliable and it behaves exactly the same as what the in-built do-file editor does. The temp file is harmless since it has just been temporarily saved in a cache folders in the OS X.
 			
2. For Windows users, please follow the instructions in the webpage above.
        
3. This plugin has been tested on Mac OS X Yosemite and El Capitan and supports Stata 12-14SE/MP/IC. (It should also work well with Stata 11, but has not been formally tested)

## Screenshots for syntax highlighting
![ScreenShot](https://github.com/zizhongyan/stata-vim-syntax/blob/master/screenshots/Screen.Shot.2015-12-22.at.14.04.45.png)
![ScreenShot](https://github.com/zizhongyan/stata-vim-syntax/blob/master/screenshots/Screen.Shot.2015-12-22.at.14.01.27.png)
![ScreenShot](https://github.com/zizhongyan/stata-vim-syntax/blob/master/screenshots/Screen.Shot.2015-12-22.at.14.02.01.png)
![ScreenShot](https://github.com/zizhongyan/stata-vim-syntax/blob/master/screenshots/Screen.Shot.2015-12-22.at.14.02.29.png)
![ScreenShot](https://github.com/zizhongyan/stata-vim-syntax/blob/master/screenshots/Screen.Shot.2015-12-22.at.14.03.49.png)
