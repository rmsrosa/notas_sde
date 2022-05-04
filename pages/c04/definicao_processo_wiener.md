@def title = "Definição"

# {{ get_title }}

O processo de Wiener é um processo estocástico que formaliza as ideias do movimento Browniano. Por conta disso, ele é também chamado de processo Browniano, ou mesmo de movimento Browniano, mas vale ressaltar que muitos autores diferenciam o fenômeno físico observado por Robert Brown, em 1827, e denominado de movimento Browniano, da formalização matemática denominada de processo de Wiener ou processo Browniano.

## Processo de Wiener

Um **processo de Wiener (padrão)**, ou **processo Browniano (padrão)**, é um processo estocástico real $\{W_t\}_{t \geq 0}$ tal que
1. $W_0 = 0$;
2. $\{W_t\}_{t\geq 0}$ possui incrementos independentes, i.e. para $t_j \geq 0$ e $\tau_j > 0$, para $j = 1, \ldots, J$, $J\in\mathbb{N}$, então as variáveis aleatórias $\Delta W_j = W_{t_j + \tau_j} - W_{t_j}$, $j = 1, \ldots, J$, são independentes.
3. Para quaisquer $t\geq 0$ e $\tau > 0$, o incremento $W_{t + \tau} - W_t$ possui distribuição normal com média zero e desvio padrão $\tau$, i.e.
$$
W_{t + \tau} - W_t \sim \mathcal{N}(0, \tau), \quad \forall t \geq 0, \; \forall \tau > 0.
$$
4. Com probabilidade um, os caminhos amostrais são contínuos, i.e.
$$
\mathbb{P}(\{\omega \in \Omega; \; t \rightarrow X_t(\omega) \text{ é contínuo}\}) = 1.
$$

Mais geralmente, um **processo de Wiener** pode começar em $W_0 = x$ arbitrário e ter incrementos $W_{t + \tau} - W_t \sim \mathcal{N}(0, \tau)$, além dos caminhos contínuos quase sempre e dos incrementos independentes e estacionários.

Essa tipo de processo estocástico, como modelo para o movimento Browniano, foi introduzido por N. Wiener, nos anos 1920, junto com a demonstração de existência de tal processo.
