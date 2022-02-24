# Configuration

## config vars
+++
prepath = "booksjl-franklin-template"
content_tag = ""
ignore = ["_weave/", "_jupyter/", "_literate"]
+++

## book variables
+++
book_title = "Book Template for Franklin"
book_subtitle = "Create books with Franklin.jl"
book_author = "<a href=\"https://rmsrosa.github.io\">Ricardo M. S. Rosa</a>"
show_license = true
book_license = "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication"
license_link = "https://creativecommons.org/publicdomain/zero/1.0/"
book_licensees = ""
+++

## menu variables
+++
show_aside = true
show_github = true
github_repo = "https://github.com/rmsrosa/booksjl-franklin-template"
+++

## navigation links
+++
nav_on_top = true
nav_on_bottom = true
+++

## toc variables
+++
page_numbering = true
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
+++

## page variables
+++
show_link_bagdes = true
link_view_source = true
link_download_notebook = true
link_nbview_notebook = true
link_binder_notebook = true
website = "rmsrosa.github.io/booksjl-franklin-template"
+++

## binder variables
+++
nbgitpuller_repo = "rmsrosa/booksjl-franklin-template"
nbgitpuller_branch = "binderenv"
binder_application = "lab" 
+++
