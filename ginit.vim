""nvim-gtk
if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'Consolas 10') " Font settings
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0) " To disable external tabline (enabled by default)
endif

""nvim-qt
if exists('g:GuiLoaded')
    set guioptions=mlrb
    Guifont! Fira\ Code\ Retina:h9
    " Guifont! Source\ Code\ Pro:h10
    GuiRenderLigatures 1
    GuiAdaptiveColor 0
    call GuiWindowMaximized(1)
endif


