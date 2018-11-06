# tail-messages-mode [![Build Status](https://travis-ci.org/EricCrosson/tail-messages-mode.svg?branch=master)](https://travis-ci.org/EricCrosson/tail-messages-mode) [![Version](https://img.shields.io/github/tag/EricCrosson/tail-messaages-mode.svg)](https://github.com/EricCrosson/tail-messaages-mode/releases)

> Tail \*Messages\* buffer

## Install

With [Quelpa](https://framagit.org/steckerhalter/quelpa)

``` {.sourceCode .lisp}
(use-package tail-messages-mode
  :quelpa (tail-messages-mode
           :fetcher github
           :repo "EricCrosson/tail-messages-mode"))
```

> Note: this project is not destined for [MELPA](https://melpa.org/)

Or manually, after downloading into your `load-path`

``` {.sourceCode .lisp}
(require 'tail-messages-mode)
```

## Use

Invoke `tail-messages-mode` when desired.

## Acknowledgements

- [Original StackOverflow post](https://stackoverflow.com/a/4685005/10596482)

## License

GPL 2 (or higher) © [Free Software Foundation, Inc](http://www.fsf.org/about).
