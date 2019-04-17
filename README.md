# vim-auto-cursorline

![demo](https://user-images.githubusercontent.com/1239245/56327655-4c169000-61b6-11e9-8cb8-23d3ca1773a7.gif)

Show / hide cursorline in connection with cursor moving.

## What's this?

This plugin manages the `'cursorline'` option to show / hide it according to
necessity. It shows / hides cursorline in these cases below.

### show

* opening buffers
* moving into the window
* holding the cursor in a certain wait (customizable)

### hide

* moving the cursor inside the window

## Why is this plugin needed?

The cursorline option takes a bit heavy CPU usage. It slows the cursor moving
vertically. In addition, you need cursorline only when you are missing the
cursor.  Hiding cursorline should make it easy to read characters on the line.

##  Install

Clone this repository and add the dir to `'runtimepath'`.

```vim
set runtimepath+=/path/to/this/repo
```

Or, use your favorite plugin managers.

## Setting

### `g:auto_cursorline_wait_ms`

It waits this value milliseconds before hiding cursorline. Default: 1000.

## Background

The idea of this plugin is derived from [this entry][] (in Japanese). One of
the reason why I did “reinventing the wheel” is because the original one uses
the `'updatetime'` option to wait before hiding cursorline. But other plugins,
such as [vim-gitgutter][], uses `'updatetime'` for different usages. I made
this plugin for setting the designated value for the time before hiding the
cursorline.

[this entry]: https://thinca.hatenablog.com/entry/20090530/1243615055
[vim-gitgutter]: https://github.com/airblade/vim-gitgutter
