@def title = "Introduction"

# {{ get_title }}

With this template, you have the table of contents in the menu bar on the left of each page and navigation links on the top and bottom of each page.

The structure of the menu should be configured in the file `config.md`, at the root directory of the project. Both the menu bar and the navigation buttons are automatically built from this structure. Each page can be numbered, if so configured.

Pages can be generated from markdown files, julia scripts or jupyter notebooks, rendered by either [Franklin.jl](https://github.com/tlienart/Franklin.jl), [Weave.jl](https://github.com/JunoLab/Weave.jl), or [Literate.jl](https://github.com/fredrikekre/Literate.jl).

[Jupyter](https://jupyter.org) notebooks are also automatically generated via [Weave.jl](https://github.com/JunoLab/Weave.jl) or [Literate.jl](https://github.com/fredrikekre/Literate.jl). [Badges](https://shields.io) to download or open the associated notebooks in [NBViewer](https://nbviewer.org) or [Binder](https://mybinder.org), and to view the source code can also be added to each page.

More details in the appropriate sections.
