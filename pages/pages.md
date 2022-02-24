@def title = "Pages"

# {{ get_title }}

1. The pages for the book must be in either of the folders `pages/`, `_weave/`, `_literate/`, or `_jupyter/` in order to be properly processed. They don't need to be in the root of each of these subfolders; they can be further nested as desired.

1. Depending on the folder, the file is executed and rendered by either [Franklin.jl](https://github.com/tlienart/Franklin.jl), [Weave.jl](https://github.com/JunoLab/Weave.jl), or [Literate.jl](https://github.com/fredrikekre/Literate.jl).

1. The files can be in either Franklin's Markdown, Weave's/Juno's Markdown, Literate's Markdown, Jupyter notebook, or plain julia script format with markdown-like comments.

1. The title on each Franklin's markdown page, under `pages/`, is set by the line `@def title = "Title of the Section"`, followed by the line `# {{ get_title }}`, which builds the title with the proper numbering. Check the [raw file for this page](https://github.com/rmsrosa/booksjl-franklin-template/blob/main/pages/pages.md).

1. The title on the pages within `_weave/`, `_literate/` or `_jupyter` should be defined as usual for markdown files, with `# Title of the Section`. These will be processed to the format above, to be properly rendered by Franklin.

1. Each page generated from source files in either `_weave/`, `_literate/`, or `_jupyter` may contain badge links to associated Jupyter notebooks, for either downloading it or opening it in either NBViewer or Binder. This can be achieve by the following configuration variables in `config.md`:
    * `show_link_bagdes::Bool`: whether to add any of the link badges to the top of each weaved or literated page;
    * `link_view_source::Bool`: whether to include a badge to view the source used for the current page, if processed by [Weave.jl](https://github.com/JunoLab/Weave.jl) or [Literate.jl](https://github.com/fredrikekre/Literate.jl);
    * `link_download_notebook::Bool`: whether to include a badge to download the associated Jupyter notebook;
    * `link_nbview_notebook::Bool`: whether to include a badge to open the associated Jupyter notebook in NBViewer;
    * `link_binder_notebook::Bool`: whether to include a badge to open the associated Jupyter notebook in Binder;
    * `website::String`: url of the website, used to properly launch the associated notebook in NBViewer.
