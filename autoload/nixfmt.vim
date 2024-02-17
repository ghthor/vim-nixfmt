" fmt.vim: Vim command to format *.nix files with `nix fmt`.

if !exists('g:nix_fmt_fail_silently')
    let g:nix_fmt_fail_silently = 0
endif

if !exists('g:nix_fmt_options')
    let g:nix_fmt_options = ''
endif

" Below function is copied from vim-hclfmt's fmt.vim file.
function! nixfmt#Format()
    if !executable("nix")
        echo "nixfmt: could not find nix command. Please install nix"
        return ""
    endif

    " save cursor position and many other things
    let l:curw=winsaveview()

    " Write current unsaved buffer to a temp file
    let l:tmpname = tempname() . ".nix"
    call writefile(getline(1, '$'), l:tmpname)

    let fmt_command = "nix fmt"

    " populate the final command with user based fmt options
    let command = fmt_command . " " . g:nix_fmt_options . " " . shellescape(l:tmpname)

    " execute our command...
    let out = system(command)

    "if there is no error on the temp file replace the output with the current
    "file (if this fails, we can always check the outputs first line with:
    "splitted =~ 'package \w\+')
    if v:shell_error == 0
        " remove undo point caused via BufWritePre
        try | silent undojoin | catch | endtry

        " let out = system("diff -u " . expand('%:S') . " " . shellescape(l:tmpname))
        " echo out

        " Replace current file with temp file, then reload buffer
        call rename(l:tmpname, expand('%'))
        silent edit!
        let &syntax = &syntax
    elseif g:nix_fmt_fail_silently == 0
        echo out
        " We didn't use the temp file, so clean up
        call delete(l:tmpname)
    endif

    " restore our cursor/windows positions
    call winrestview(l:curw)
endfunction


" vim:ts=4:sw=4:et
