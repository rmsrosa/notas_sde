@def title = "Média, variância e outros momentos"

# {{ get_title }}

## Valor esperado

O **valor esperado**, ou média, de uma variável aleatória, é como uma média ponderada dos possíveis valores da variável, ponderados pela probabilidade de cada realização. No caso de uma variável discreta $X$ (finita ou infinita enumerável) com possíveis valores $\Sigma = \{x_j\}_j$, respectivas probabilidades $0 \leq p_j \leq 1$, com $\sum_j p_j = 1$, o valor esperado de $X$ é
$$
\mathbb{E}[X] = \sum_j x_j p_j.
$$

Nem sempre o valor esperado está definido. Por exemplo, considere a variável aleatória que assume valores inteiros com probabilidades dadas pelos termos da série de Euler (normalizada)
$$
p_n = \frac{6}{\pi^2 n^2}.
$$
Naturalmente,
$$
\sum_n p_n = \frac{6}{\pi^2}\sum_{n\in \mathbb{N}}\frac{1}{n^2} = 1,
$$
de modo que $X$ é uma variável aleatória. O seu valor esperado, no entanto, é indefinido, já que
$$
\mathbb{E}(X) \stackrel{?}{=} \sum_n p_n n = \frac{6}{\pi^2} \sum_{n\in \mathbb{N}} \frac{1}{n} = \infty
$$
é uma série divergente.
