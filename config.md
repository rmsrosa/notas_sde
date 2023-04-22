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
        "pages/c01/movimento_browniano"
        "pages/c01/modelo_einstein"
        "pages/c01/passeioaleatorio_movbrowniano"
        "pages/c01/modelo_bachelier"
        "pages/c01/aspectos_numericos"
        "pages/c01/simulacoes_intro"
    ]
    "Variáveis Aleatórias" => [
        "pages/c02/definicao_va"
        "pages/c02/exemplos_va_discretas"
        "pages/c02/exemplos_va_continuas"
        "pages/c02/media_momentos"
        "pages/c02/prob_condicionada"
        "pages/c02/desigualdades"
        "pages/c02/multi_va"
        "pages/c02/transformacoes"
        "pages/c02/convergencias"
        "pages/c02/borel_cantelli"
        "pages/c02/teorema_central"
    ]
    "O método de Monte-Carlo" => [
        "pages/c03/monte_carlo"
        "pages/c03/histograma"
        "pages/c03/gerando_num_aleatorios"
    ]
    "Processos Estocásticos" => [
        "pages/c04/definicao_pe"
        "pages/c04/processos_discretos"
        "pages/c04/processos_continuos"
        "pages/c04/tipos_processos"
        "pages/c04/filtracao"
        "pages/c04/cadeias_markov"
        "pages/c04/existencia_processo_wiener"
        "pages/c04/continuity_kolmogorov"
    ]
    "Processos de Wiener" => [
        "pages/c05/definicao_processo_wiener"
        "pages/c05/existencia_processo_wiener"
        "pages/c05/propriedades_wiener"
        "pages/c05/ruido_branco"
        "pages/c05/simetrias_wiener"
        "pages/c05/naodiferenciabilidade_wiener"
        "pages/c05/variacao_ilimitada_wiener"
    ]
    "Integração estocástica" => [
        "pages/c06/integral_riemann"
        "pages/c06/integral_riemannstieltjes"
        "pages/c06/integral_dualidade"
        "pages/c06/riemann_wiener"
        "pages/c06/integral_ito"
        "pages/c06/integral_ito_propriedades"
        "pages/c06/formula_ito"
    ]
    "Equações diferenciais aleatórias" => [
        "pages/c07/existence_solutions_rde"
        "pages/c07/basic_examples_rde"
        "pages/c07/logistic_rde"
    ]
    "Equações diferenciais estocásticas" => [
        "pages/c08/setting"
        "pages/c08/existence_solutions_sde_particulares"
        "pages/c08/existence_solutions_sde"
        "pages/c08/unicidade_sol_sde"
        "pages/c08/continuidade_caminhos"
        "pages/c08/linear_sde"
        "pages/c08/geometric_brownian"
        "pages/c08/brownian_bridge"
        "pages/c08/ornstein_uhlenbeck"
        "pages/c08/feynmann_kac"
        "pages/c08/relacoes_rode_sde"
    ]
    "Métodos numéricos" => [
        "pages/c09/tx_convergencia"
        "pages/c09/simulacoes_wiener"
        "pages/c09/convergencia_euler_maruyama"
        "pages/c09/simulacoes_convergencia_em"
        "pages/c09/heun"
        "pages/c09/simulacoes_convergencia_randomheun"
        "pages/c09/milstein"
        "pages/c09/simulacoes_milstein"
        "pages/c09/sciml"
    ]
    "Evolução da função densidade de probabilidade" => [
        "pages/c10/deterministic"
        "Evolução no caso de equações aleatórias"
        "Kolmogorov backward equation"
        "Kolmogorov forward equation"
        "Evolução no caso de equações estocásticas"
        "Soluções estacionárias"
        "Métodos numéricos"
    ]
    "Sistemas de equações aleatórias"
    "Sistemas de equações estocásticas" => [
        "pages/c11/nuclear_reactions"
        "pages/c11/stochastic_sir"
        "pages/c11/stochastic_sir_network"
    ]
    "*Apêndice" => [
        "pages/appendix/teo_fund_kolmogorov"
        "pages/appendix/teo_extension_kolmogorov"
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
