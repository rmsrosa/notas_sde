# Book Template for Franklin.jl

[docs-dev-img]: https://img.shields.io/badge/docs-dev-green.svg
[docs-dev-url]: https://rmsrosa.github.io/booksjl-franklin-template/


[![][docs-dev-img]][docs-dev-url] [![License: GPL v3](https://img.shields.io/badge/License-CC0&#160;1.0-orange.svg)](https://creativecommons.org/publicdomain/zero/1.0/) ![GitHub repo size](https://img.shields.io/github/repo-size/rmsrosa/booksjl-franklin-template)

Book-like template for [Thibaut Lienart](https://github.com/tlienart)'s static web-site generator [Franklin.jl](https://github.com/tlienart/Franklin.jl).

It currently has the following features:

* Provides a menu bar with a table of contents for a given collection of pages (as listed in the variable `menu`, in [config.md](config.md));
* Navigation links on each page;
* Automatic numbering of some or all pages, as desired;
* Pages generated in several different formats:
    * [Franklin.jl](https://github.com/tlienart/Franklin.jl)'s native markdown flavor;
    * Julia Markdown (`.jmd` files) executed by [Weave.jl](https://github.com/JunoLab/Weave.jl) itself.
    * [Literate.jl](https://github.com/fredrikekre/Literate.jl)'s Markdown  executed by [Literate.jl](https://github.com/fredrikekre/Literate.jl) itself.
    * Pure julia scripts (with Markdown comments) executed by either [Literate.jl](https://github.com/fredrikekre/Literate.jl) or [Weave.jl](https://github.com/JunoLab/Weave.jl).
    * [Jupyter](https://jupyter.org) notebooks converted to Franklin's markdown with [Weave.jl](https://github.com/JunoLab/Weave.jl).
* All execution/rendering generated automatically, based on the folder they belong to (whether `pages/`, `_weave/`, `_literate/` or `_jupyter`, with the files in the latter three folders being rendered to markdown files in `pages/weaved/`, `pages/literated/`, and `pages/jupytered`, respectively).
* Whatever the source file, a [Jupyter](https://jupyter.org) notebook is generated for each page.
* Badge links included on each page to either download the associated jupyter notebook, or view it in [NBViewer](https://nbviewer.org), or launch it in [Binder]([Literate.jl](https://github.com/fredrikekre/Literate.jl)), or download its source.
* Appealing visual display based on [Rik Huijzer](https://github.com/rikhuijzer)'s CSS used in [Books.jl](https://github.com/JuliaBooks/Books.jl).


This is an off-spring of the draft template in [tlienart/booksjl-franklin](https://github.com/tlienart/booksjl-franklin), with many extra goodies.

> **:warning: WARNING:**
> This template is under active development and in alpha stage, with the code being optimized, bugs being addressed, and more tools/configurations being implemented. If you are interested, feel free to use it and report eventual problems. Contributions are also welcome.
