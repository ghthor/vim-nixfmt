if get(g:, "nix_fmt_autosave", 1)
    autocmd BufWritePre *.nix call fmt#Format()
endif

command! -nargs=0 NixFmt call fmt#Format()


" vim:ts=4:sw=4:et
