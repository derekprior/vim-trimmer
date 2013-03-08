# vim-trimmer

A super-simple vim plugin that:
* Defines a `TrimTrailingWhitespace` function that can be called on demand. The
  function removes trailing whitespaces while preserving your cursor position.
* Optionally adds an autocommand that calls the function on each buffer write.
* Optionally disables the autocommand for specified blacklisted filetypes (see
  configuration).

## Installation

Use [Vundle][v] and add the following to your `.vimrc`:

```
Bundle 'derekprior/vim-trimmer'
```

Run the `:BundleInstall` command and you're off.

## Configuration

Under the default configuration, vim-trimmer will simply add the
`TrimTrailingWhitespace` function that you can call directly or map as you see
fit.

To enable the autocommand on buffer writes, add `let g:trimmer_autocommand = 1`
to your `.vimrc`. If you enable the autocommand in this manner and want to
disable it for a given session, run the command `:unlet g:trimmer_autocommand`.

To opt certain filetypes out of the autocommand, add them to the blacklist
array like so: `let g:trimmer_blacklist = ['markdown', 'make']. You can still
run the `TrimTrailingWhitespace` function manually on blacklisted filetypes.

[v]:https://github.com/gmarik/vundle
