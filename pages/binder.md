@def title = "Binder Configuration"

# {{ get_title }}

As explained in Section [Pages](/pages/pages), the `link_binder_notebook` can be set to true in order to display a badge link to launch the associated Jupyter notebook of each page (in `_weave` or `_literate`) on [Binder](https://mybinder.org). For that to happen properly, the following configuration variables must be set in `config.md`:

* `nbgitpuller_repo::String`: the repository from where [Binder](https://mybinder.org) will build the sysimage to open the notebook with the properly configured environment;
* `nbgitpuller_branch::String`: the branch of `nbgitpuller_repo` from where [Binder](https://mybinder.org) will build the sysimage;
* `binder_application::String`: the type of binder application to be open, which can be set to either of the following, according to [nbgitpuller documentation](https://jupyterhub.github.io/nbgitpuller/index.html):
    * "": Classic Jupyter Notebook;
    * "retro: [RetroLab](https://github.com/jupyterlab/retrolab);
    * "lab": [JupyterLab](https://github.com/jupyterlab/jupyterlab);
    * "rstudio": [RStudio](https://docs.rstudio.com/connect/user/jupyter-notebook/);
    * "shiny": [Shiny](https://docs.rstudio.com/connect/user/shiny/);
    * Or some other relative url to direct user to.

The following variables are also used for Binder:

* `github_repo::String`: path to the repository.
* `prepath::String`: pre-path to the website, relative to the root url.

One could use the same repository for the contents of the book and for building the Binder environment. However, every time you make a change to the contents of the book and push it to the repo, Binder will have to rebuild the sysimage and that may takes several minutes.

The best approach is to have a separate branch or repository for the Binder setup, which is called the `puller` repo. The repo/branch with the notebooks is called the `pulled` repo. This is the magic that [nbgitpuller](https://jupyterhub.github.io/nbgitpuller) does. The `puller` repo only needs to contain some minimal configuration for Binder, along with the `Project.toml` file with all the packages to be used by the notebooks.

Typically, `Project.toml` in the `puller` repo would be nearly the same as that in the `pulled` repo. The difference is that `Franklin`, `Weave`, `Literate`, and `NodeJS` don't need to be there, because they are not (usually) used by the notebooks themselves, only for building the static site.

Note, however, that if you don't launch Binder for some time, then the sysimage may not be stored anymore and it may take a long time again. But if you use it with some reasonable frequency, this should speed up the process considerably.

In this template repository, we have the following configuration:

* The `nbgitpuller_repo` is the same repo of the template. One difference from `github_repo` is that `nbigitpuller_repo` doesn't need to contain the full path, starting with the github url.
* The `nbgitpuller_branch` is set to `binderenv`, which the branch containing the configuration files for Binder.
* The `binder_application` is set to `lab/`, so JupyterLab is used to open the notebooks.
