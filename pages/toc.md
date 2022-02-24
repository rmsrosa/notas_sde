@def title = "Table of Contents"

# {{ get_title }}

In the [config.md](https://raw.githubusercontent.com/rmsrosa/booksjl-franklin-template/main/config.md) file, you should define

* `page_numbering::Bool`: whether to enumerate the sections/pages of the book or not,

and, the most important variable,

* `menu::Vector{<:Union{String, Pair{String, Vector{String}}}}`: structure of the menu.

## Example Menu

The behavior of the `menu` variable is best understood with an example. Consider the one used in this book/documentation, which yields the table of contents on the menu bar on the left:

```julia
menu = [
    "*pages/intro",
    "*PART I",
    "Configurations" => [
        "pages/book",
        "pages/style",
        "pages/menu_bar",
        "pages/toc",
        "pages/navigation",
        "pages/pages",
        "pages/binder",
    ],
    "*PART II",
    "pages/math_and_code" => [
        "pages/franklinmd",
        "_literate/literatejl.jl",
        "_weave/weavejl.jl",
        "_weave/weavejmd.jmd",
        "_jupyter/notebook.ipynb"
    ],
    "*pages/appendix",
]
```

Notice how the entries that start with `*` do not get numbered, and how those that do not start with either `pages/`, `_weave/`, `_literate/`, or `_jupyter` just have the title and don't link to any page, regardless of being a pair pointing to a vector of subsections or not.

## Rules

1. When a string starts with either `pages/`, `_weave/`, `_literate/`, or `_jupyter`, it means it points to a file. The title is grabbed from the file.

1. If an entry points to a file but has no extension, it is assumed to have the `.md` extension.

1. When a string does not start with either of the prefixes above, it does not point to any content file, and simply contains the title of the entry.

1. When an entry is a `Pair`, the second value of the `Pair` is a `Vector of Strings` with the list of subsections, each of them following the pattern above.

1. Inspired by LaTeX, if a string starts with a `*`, it is not to be numbered. Contrarily to LaTeX, however, if that string points to a lists of subsections, none of them gets numbered either, regardless of starting with `*` or not.

1. When the entry points to a file, then, depending on the folder, the file is executed and rendered by either [Franklin.jl](https://github.com/tlienart/Franklin.jl), [Weave.jl](https://github.com/JunoLab/Weave.jl), or [Literate.jl](https://github.com/fredrikekre/Literate.jl). Depending on the case, the file can be either Franklin's Markdown, Weave's/Juno's Markdown, Literate's Markdown, a plain julia script with markdown-like comments, or a jupyter notebook.
