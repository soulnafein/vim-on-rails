# VIM on Rails

VIM on Rails is an opinionated sets of VIM plugins, colorschemes, settings
and shortcuts design for Ruby on Rails development. 
It's a work in progress and I will add features along the way.

I will try to document possible scenarios developers found themselves when
writing Ruby on Rails code. For each scenario I'll list the way I've solved it.

## Installation

	git clone https://github.com/soulnafein/vim-on-rails.git
	cd vim-on-rails
	rake install

This will take care of your existing .vim folder and .vimrc .gvimrc files
You can restore your previous VIM environment by typing:

`rake uninstall`

# Use cases

## Editing

Common developers editing needs. I will assume a basic knowledge of VIM modes, 
movement commands and so on.

### Move one or more lines up or down the file

  `CTRL + UP` or `CTRL + DOWN` moves one line. Selects more than one line in 
  visual mode to move them up as well (e.g. `SHIFT+V`)

### Move a whole method definition up and down
 
  TODO

### Quickly saving a file

  Just press `CTRL+S` baby! Because :w is just awkward.
  I might actually try to implement the autosave file when it loses focus like in RubyMine
  
  Press `CTRL+ALT+S` to save all buffers (e.g. :wall)

### Code completion (based on word in the file)

  `CTRL + SPACE`

### Jump to method or class in current file

  Not sure yet about the shortcut yet. The command is
  `:FufBufferTagAll` and it's provided by FuzzyFinder plugin

### Surround current visual selection with double quotes

  I have to use surround.vim plugin but I'm not sure how yet

### Jump to definition of current cursor element
  
  Not available yet.

## Open file in current window

### Open a file by using FuzzyFinder
  
  `CTRL+SHIFT+N`

### Switch to currently open buffer
  
  Again thank you FuzzyFinder
  ALT+SHIFT+N

### Open file in the same folder as current one

  `,e` and type the name of the file and enter

## Window splits

### Split vertically

`CTRL+W, v`

### Split horizontally

`CTRL+W, n`

### Move between windows

`CTRL+W, direction` where direction is one of h,j,k,l

### Enlarge current window (ZoomWin plugin)

`,,` and the same again to zoom out

## Debugging

Not implemented yet