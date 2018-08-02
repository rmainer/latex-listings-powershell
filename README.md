# latex-listings-powershell

## Description
[latex-listings-powershell.tex](src/latex-listings-powershell.tex) adds PowerShell syntax highlighting support for the [listings](https://ctan.org/pkg/listings) package of LaTeX.

## Files
* `src/latex-listings-powershell.tex`: Include this file into your LaTeX source to add syntax highlighting for PowerShell
* `src/p2l.ps1`: PowerShell script which generates `latex-listings-powershell.tex`

## Usage
It's very simple: `\input{/path/to/latex-listings-powershell.tex}`

## Example
See [example.tex](examples/example.tex) for usage, the generated PDF looks like [this](examples/example.pdf).
