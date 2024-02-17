if get(g:, "nix_fmt_autosave", 1)
    autocmd BufWritePre *.nix call nixfmt#Format()
endif

command! -nargs=0 NixFmt call nixfmt#Format()


" vim:ts=4:sw=4:et
