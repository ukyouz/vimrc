""nvim-gtk
if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'Consolas 10') " Font settings
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0) " To disable external tabline (enabled by default)
endif

""nvim-qt
if exists('g:GuiLoaded')
    set guioptions=mlrb

    if exists(':GuiAdaptiveColor')
        GuiAdaptiveColor 1
    endif

    if exists(':GuiRenderLigatures')
        GuiRenderLigatures 1
    endif

    " Set Editor Font
    if exists(':GuiFont')
        " Use GuiFont! to ignore font errors
        " Guifont! Fira\ Code\ Retina:h9
        " Guifont! Fira\ Code:h9
        " Guifont! Consolas:h10

        " https://github.com/equalsraf/neovim-qt/issues/532
        Guifont! JetBrains\ Mono:h9:w60
    endif

    " Disable GUI Tabline
    if exists(':GuiTabline')
        GuiTabline 0
    endif

    " Disable GUI Popupmenu
    if exists(':GuiPopupmenu')
        GuiPopupmenu 0
    endif

    " Enable GUI ScrollBar
    if exists(':GuiScrollBar')
        GuiScrollBar 0
    endif

    call GuiWindowMaximized(1)
    " execute ":Startify"
endif


