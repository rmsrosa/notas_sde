@def title = "Conceitos essenciais"

# {{ get_title }}

Um processo estocástico é, essencialmente, uma família de variáveis aleatórias $\{X_t\}_{t\in I}$ indexada por algum conjunto $I.$ Vamos considerar, mais especificamente, $I\subset \mathbb{R},$ em duas situações específicas, como um subintervalo da reta ou como um conjunto discreto enumerável da reta. Em muitos casos, $t$ representa uma variável temporal, discreta ou contínua, e $X_t$ indica a variação do estado de algum sistema ao longo do tempo, por exemplo.

A definição acima, porém, é um tanto vaga. Uma definição mais precisa de um **processo estocástico** $\{X_t\}_{t\in I}$ é a de que as variáveis aleatórias $X_t$ são funções (mensuráveis) definidas em um mesmo **espaço amostral** $(\Omega, \mathcal{F}, \mathbb{P})$ e assumindo valores em um mesmo **espaço de estados** $(\Sigma, \mathcal{E}).$

Classificamos um processo de acordo com a natureza do conjunto de índices $I\subset \mathbb{R}$ e do conjunto eventos $\Sigma.$ Dizemos que $\{X_t\}_{t\in I}$ é um **processo estocástico em tempo discreto** quando $I$ é discreto, e.g. $I = \mathbb{Z},$ ou $I=\mathbb{Z}^* = \{0, 1, 2, \ldots\},$ ou $I = \mathbb{N},$ ou $I = \{(t_1, t_2, \ldots)\; t_j \in \mathbb{R}, \; t_j < t_{j+1}\}.$ Dizemos que $\{X_t\}_{t\in I}$ é um **processo estocástico em tempo contínuo** quando $I$ for um intervalo não trivial, e.g. $I=\mathbb{R},$ ou $I=[0, \infty)$ ou $I=[t_0, t_f].$

No caso do conjunto de eventos, dizemos simplesmente que é um **processo estocástico discreto,** quando $\Sigma$ é discreto, ou um **processo estocástico contínuo,** quando $\Sigma$ é contínuo.

Vale ressaltar que a função $X_t$ é uma função determinística, levando cada $\omega \in \Omega$ em um estado $X_t(\omega) \in \Sigma.$ A incerteza vem da interpretação de que cada **realização** $X_t(\omega)$ ou cada conjunto de realizações vem com uma certa probabilidade de ser *observado.* A análise, em si, é que é probabilística por natureza.

Em relação aos conjuntos amostrais, definidos pela $\sigma$-álgebra $\mathcal{F},$ é necessário que cada $X_t$ seja uma variável aleatória em relação a essa $\sigma$-álgebra. Ou seja, para cada evento $E\in \mathcal{E},$ devemos ter $X_t^{-1}(E)\in \mathcal{F}.$ Dizemos, assim, que $X_t$ é **mensurável,** ou, mais precisamente, que é $(\Omega, \mathcal{F})$-$(\Sigma, \mathcal{E})$-mensurável.

Para cada $\omega\in \Omega,$ a função $t \mapsto X_t(\omega)$ é chamada de **trajetória**, ou **caminho amostral**. É comum denotarmos um caminho por $x(t, \omega) = X_t(\omega).$ A distribuição de probabilidade nos dá não apenas a probabilidade de observarmos um determinado valor, em um determinado instante, mas também a probabilidade de observamos toda uma trajetória, ou trajetórias, ou partes dela. 

Com as variáveis aleatórias definidas no mesmo espaço amostral, com medida de probabilidade $\mathbb{P},$ podemos representar a probabilidade do processo assumir um determinado valor $x_1,$ em um certo instante $t,$ por
$$
\mathbb{P}(X_t = x_1)
$$

Por sua vez, a probabilidade conjunta de observarmos uma trajetória assumindo estados $x_1, x_2\in \Sigma,$ em dois instantes $t_1, t_2 \in I,$ por $\mathbb{P}(X_{t_1} = x_1, X_{t_2} = x_2).$ E assim por diante.

O conjunto $\Omega$ é um tanto abstrato, podendo ser representado de várias formas possíveis, ou normalmente nem sendo especificado. Mas é instrutivo pensarmos $\Omega,$ mais concretamente, como sendo o próprio conjunto $\Omega = \Sigma^I = \{x:I \rightarrow \Sigma\}$ de todas as trajetórias $x:I \rightarrow \Sigma$ possíveis, definidas no intervalo de tempo $I,$ e assumindo qualquer estado em $\Sigma.$ Naturalmente, esperamos observar só algumas trajetórias em um dado processo, o que será determinado pela probabilidade de cada trajetória, ou, mais precisamente, da probabilidade de cada subconjunto *mensurável* $F\subset \Omega,$ ou seja, de cada $F\in\mathcal{F}.$

Pensando assim, a probabilidade $\mathbb{P}(X_t = x_1)$ de, em um determinado instante $t\in I,$ observamos um certo evento $x_1,$ é a probabilidade $\mathbb{P}(A)$ do conjunto $A = \{x:I \rightarrow \Sigma; \;x(t) = x_1\}$ de todas as trajetórias que passam por $x_1$ no instante $t.$

Por sua vez, a probabilidade conjunta $\mathbb{P}(X_{t_1} = x_1, X_{t_2} = x_2),$ em dois instantes $t_1, t_2 \in I$ e para dois eventos $x_1, x_2\in \Sigma,$ é a probabilidade $\mathbb{P}(A)$ do conjunto $A = \{x:I \rightarrow \Sigma; \;x(t_1) = x_1, \;x(t_2) = x_2\}.$

No caso de um processo real, i.e. em que o espaço de eventos $\Sigma$ é um subconjunto de $\mathbb{R},$ a probabilidade $\mathbb{P}$ pode ser caracterizada pelas funções de probabilidade acumuladas (conjuntas). A **função de probabilidade acumulada** no instante $t$ é definida por
$$
F_t(x) = \mathbb{P}(X_t \leq x)
$$
e as **funções de probabilidade acumulada conjuntas**, por
$$
F_{t_1, \ldots, t_n}(x_1, \ldots, x_n) = \mathbb{P}(X_{t_1} \leq x_1, \ldots X_{t_n} \leq x_n).
$$

Por construção, essa família de funções de distribuição $\{F_{t_1, \ldots, t_n}\}_{n\in \mathbb{N}, t_1, \ldots, t_n \in I}$ satisfaz duas condições fundamentais:

1. **Simetria:** Sejam $n\in \mathbb{N},$ $n \geq 2,$ e $t_1, \ldots, t_n\in I.$ Se $(i_1, \ldots, i_n)$ é uma permutação dos índices $(1, \ldots, n),$ então $F_{t_{i_1}, \ldots, t_{i_n}}(x_{i_1}, \ldots, x_{i_n}) = F_{t_1, \ldots, t_n}(x_1, \ldots, x_n),$ para quaisquer $x_1, \ldots, x_n \in \mathbb{R}.$
2. **Compatibilidade:** Para $m < n,$ $m, n \in \mathbb{N},$ e $t_1, \ldots, t_n \in I,$ vale $F_{t_1, \ldots, t_m}(x_1, \ldots, x_m) = F_{t_1, \ldots, t_m, t_{m+1}, \ldots, t_n}(x_1, \ldots, x_m, \infty, \ldots, \infty).$

Por outro lado, um resultado importante de Kolmogorov, conhecido como o **Teorema Fundamental de Kolmogorov** (além de outros nomes, tais como **Teorema de Existência de Kolmogorov** e **Teorema de Extensão de Daniell-Kolmogorov**) garante que qualquer família de funções de distribuição satisfazendo as condições de simetria e compatibilidade definem um processo estocástico.

Este é um dos primeiros resultados profundos envolvendo processos estocásticos contínuous. Vejam, por exemplo [Kolmogorov extension theorem](https://en.wikipedia.org/wiki/Kolmogorov_extension_theorem) e [Lecture 5. The Daniell-Kolmogorov existence theorem](https://fabricebaudoin.wordpress.com/2012/03/25/lecture-5-the-daniell-kolmogorov-existence-theorem/) e [245A, Notes 6: Outer measures, pre-measures, and product measures](https://terrytao.wordpress.com/2010/10/30/245a-notes-6-outer-measures-pre-measures-and-product-measures/). Sua demonstração é baseada no Teorema de Extensão de Carathéodory, usualmente visto em Teoria da Medida
