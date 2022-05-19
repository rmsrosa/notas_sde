# Configuration

## config vars
+++
prepath = "notas_sde"
content_tag = ""
+++

## book variables
+++
book_title = "Equações Diferenciais Estocásticas e Aleatórias"
book_subtitle = "Aspectos Teóricos e Numéricos"
book_author = "<a href=\"https://rmsrosa.github.io\">Ricardo M. S. Rosa</a>"
show_license = true
book_license = "(CC BY-NC-ND 4.0) Attribution-NonCommercial-NoDerivatives 4.0 International"
license_link = "https://creativecommons.org/licenses/by-nc-nd/4.0/"
book_licensees = "Ricardo M. S. Rosa"
+++

## menu variables
+++
show_aside = false
show_github = true
github_repo = "https://github.com/rmsrosa/notas_sde"
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
    "Introdução" => [
        "pages/c01/apresentacao"
        "pages/c01/aspectos_iniciais"
        "pages/c01/aspectos_numericos"
        "src/literate/c01/simulacoes_numericas.jl"
        "pages/c01/movimento_Browniano"
        "pages/c01/passeioaleatorio_movBrowniano"
        "pages/c01/relacoes_rode_sde"
    ]
    "Variáveis Aleatórias" => [
        "pages/c02/definicao_va"
        "pages/c02/exemplos_va_discretas"
        "pages/c02/exemplos_va_continuas"
        "pages/c02/media_momentos"
        "pages/c02/identidades"
        "pages/c02/desigualdades"
        "pages/c02/multi_va"
        "pages/c02/transformacoes"
        "pages/c02/convergencias"
        "pages/c02/teorema_central"
        "pages/c02/gerando_num_aleatorios"
    ]
    "Processos Estocásticos" => [
        "pages/c03/definicao_pe"
        "pages/c03/processos_discretos"
        "pages/c03/processos_continuos"
        "pages/c03/tipos_processos"
        "pages/c03/cadeias_markov"
    ]
    "Processos de Wiener" => [
        "pages/c04/definicao_processo_wiener"
        "pages/c04/existencia_processo_wiener"
        "pages/c04/simetrias_wiener"
        "pages/c04/naodiferenciabilidade_wiener"
        "pages/c04/variacao_ilimitada_wiener"
        "pages/c04/simulacoes_wiener"
    ]
    "*Apêndice" => [
        "pages/appendix/teo_fund_kolmogorov"
    ]
    "*pages/references"
]
+++

## page variables
+++
show_link_bagdes = true
link_view_source = true
link_download_notebook = true
link_nbview_notebook = true
link_binder_notebook = true
exec_notebook = false
website = "rmsrosa.github.io/notas_sde"
+++

## binder variables
+++
nbgitpuller_repo = "rmsrosa/notas_sde"
nbgitpuller_branch = "binderenv"
binder_application = "lab" 
+++

## Extras

\newcommand{\env}[2]{@@env @@title #1@@ @@content #2 @@ @@}
