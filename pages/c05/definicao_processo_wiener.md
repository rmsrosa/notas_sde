@def title = "Definição"

# {{ get_title }}

Um processo de Wiener é um processo estocástico que formaliza as ideias do movimento Browniano. Por conta disso, ele é também chamado de processo Browniano, ou mesmo de movimento Browniano, mas vale ressaltar que muitos autores diferenciam o fenômeno físico observado por Robert Brown, em 1827, e denominado de movimento Browniano, da formalização matemática denominada de processo de Wiener ou processo Browniano.

## Processo de Wiener

Como visto anteriormente, um **processo de Wiener**, ou **processo Browniano**, é um processo estocástico real $\{W_t\}_{t \geq 0}$ tal que, para algum $x\_0\in \mathbb{R}$,
1. $W_0 = x_0$;
2. $\{W_t\}_{t\geq 0}$ possui incrementos independentes;
3. $\{W_t\}_{t\geq 0}$ possui incrementos $W_{t+\tau} - W_t$ identicamente distribuídos e dados por uma normal com média zero e variância $\tau$;
4. Com probabilidade um, os caminhos amostrais $t \mapsto W_t(\omega)$ são contínuos.

Um processo de Wiener $\{W_t\}_{t \geq 0}$ é chamado de **processo de Wiener padrão**, ou **processo Browniano padrão**, quando $x_0 = 0$, i.e.
$$
W_0 = 0.
$$

Essa definição é inspirada no modelo de Einstein para o movimento Browniano. Mas essa inspiração não é suficiente para garantir a existência de um processo com as propriedades listadas acima. A demonstração de tal existência é fundamental e será feita a seguir.
