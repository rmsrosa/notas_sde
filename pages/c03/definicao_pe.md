@def title = "Conceitos essenciais"

# {{ get_title }}

Um **processo estocástico** é, essencialmente, uma família de variáveis aleatórias $\{X_t\}_{t\in I}$, indexada por algum conjunto $I$. Usualmente, $t$ representa uma variável temporal e $I$ pode ser contínuo ou discreto.

De acordo com a natureza de $I$, dizemos que é um **processo estocástico discreto** (e.g. $I = \mathbb{Z}$ ou $I=\mathbb{Z}^* = \{0, 1, 2, \ldots\}$) ou um **processo estocástico contínuo** (e.g. $I=\mathbb{R}$ ou $I=[0, \infty)$).

Os valores assumidos pelas variáveis aleatórias $X_t$ também podem ser contínuos ou discretos, mas a caracterização acima se refere ao conjunto de índices.

Uma definição mais precisa de um **processo estocástico** requer que as variáveis aleatórias $X_t$ estejam definidas em um mesmo espaço amostral $(\Omega, \mathcal{A}, \mathbb{P})$ e assumindo valores em um mesmo espaço de estados $(\Sigma, \mathcal{E})$.

Para cada $\omega\in \Omega$, a função $t \mapsto X_t(\omega)$ é chamada de um **caminho amostral**, ou **trajetória** ou **realização**. É comum denotarmos um caminho por $x(t, \omega) = X_t(\omega)$.

Com as variáveis aleatórias no mesmo espaço amostral, com probabilidade $\mathbb{P}$, podemos representar a probabilidade do processo assumir um determinado valor $e$, em um certo instante $t$, por
$$
\mathbb{P}(X_t = e)
$$

Vale ressaltar que, agora, a probabilidade $\mathbb{P}$ não está ligada a um único tempo $t$, nem varia com $t$. Ela está ligada a *qualquer* tempo, ou, na verdade, a *todos* os tempos. Uma maneira de pensar em $\mathbb{P}$ é que ela nos dá a probabilidade de *conjuntos de trajetórias*, com $\Omega$ sendo o conjunto de todas as trajetórias possíveis. Mais especificamente, podemos pensar em $\Omega$ como sendo $\Omega = \Sigma^I = \{x:I \rightarrow \Sigma\}$, que é o conjunto de todas as trajetórias $x:I \rightarrow \Sigma$ possíveis, no intervalo de tempo $I$ e assumindo qualquer estado possível em $\Sigma$. Naturalmente, esperamos observar só algumas trajetórias em um dado processo, o que será determinado pela probabilidade de cada trajetória, ou, mais precisamente, da probabilidade de cada conjunto *mensurável* $\mathcal{A} \subset \Omega$ de trajetórias.

Pensando assim, a probabilidade $\mathbb{P}(X_t = e)$ de, em um determinado instante $t\in I$, observamos um certo evento $e$ é a probabilidade $\mathbb{P}(A)$ do conjunto $A = \{x:I \rightarrow \Sigma; \;x(t) = e\}$ de todas as trajetórias que passam por $e$ no instante $t$.

Por sua vez, a probabilidade conjunta $\mathbb{P}(X_{t_1} = e_1, X_{t_2} = e_2)$, em dois instantes $t_1, t_2 \in I$ e para dois eventos $e_1, e_2\in \Sigma$, é a probabilidade $\mathcal{P}(A)$ do conjunto $A = \{x:I \rightarrow \Sigma; \;x(t_1) = e_1, \;x(t_2) = e_2\}$.
