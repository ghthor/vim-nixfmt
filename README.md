# vim-nixfmt

Vim plugin to format nix files using `nix fmt` which I believe only works for
flakes. Please see [nix fmt]() manual entry for more details.

The plugin by default will format `*.nix`files on buffer save. 
Under the hood it uses [nix fmt]() to process the files.

TODO: gif of files being formatted
![hclfmt](http://g.recordit.co/fIQfohsGPI.gif)

## Usage

Save the file or call `:NixFmt`.

By default vim-nixfmt automatically formats `*.nix` files. You can permanently
set this configuration in your `~/.vimrc` as follows:

    let g:nix_fmt_autosave = 0


## Install

### Requirements

1. nix is installed
1. nix experimental features are enabled
  1. nix command
  1. flakes
1. each flake expected to be formatted is configured with a formatter TODO: link to docs

vim-nixfmt follows the standard runtime path structure. For Pathogen just clone
the repo. For other plugin managers add the appropriate lines and execute the
plugin's install command.

*  [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/ghthor/vim-nixfmt.git ~/.vim/bundle/vim-nixfmt`
*  [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'ghthor/vim-nixfmt'`
*  [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * `NeoBundle 'ghthor/vim-nixfmt'`
*  [Vundle](https://github.com/gmarik/vundle)
  * `Plugin 'ghthor/vim-nixfmt'`

## See Also

| Project | Link |
| - | - |
| TODO pre-commit-nixfmt | [https://github.com/ghthor/pre-commit-nixfmt](https://github.com/ghthor/pre-commit-nixfmt) |
| `nix` manual | [https://nixos.org/manual/nix/stable/introduction](https://nixos.org/manual/nix/stable/introduction) |
| `nix fmt` | [https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-fmt.html](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-fmt.html) |
