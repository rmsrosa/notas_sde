@def title = "Conjuntos de variáveis aleatórias"

# {{ get_title }}

## Independência

Duas variáveis aleatórios $X$ e $Y$ definidas em um mesmo espaço de probabilidades $(\Omega, \mathcal{A}, \mathbb{P})$ são ditas **independentes** quando a probabilidade conjunta
$$
\mathbb{P}(X \in E_1, Y \in E_2) = \mathbb{P}(\{\omega; \; X(\omega) \in E_1, \; Y(\omega) \in E_2\})
$$
é igual ao produto das probabilidades individuais (marginais), i.e.
$$
\mathbb{P}(X \in E_1, Y \in E_2) = \mathbb{P}(X \in E_1)\mathbb{P}(X \in E_2).
$$

No caso de um conjunto $X_1, \ldots, X_n$ de variáveis aleatórias, em um mesmo espaço de probabilidades, dizemos que as variáveis são **(mutuamente) independentes** quando
$$
\mathbb{P}(X_1 \in E_1, \ldots, X_n \in E_n) = \mathbb{P}(X_1 \in E_1)\cdots \mathbb{P}(X_n \in E_n).
$$

Analogamente no caso de uma coleção infinita $\{X_k\}_k$ (enumerável ou não) de variáveis aleatórias em um mesmo espaço.

Observe que podemos ter um conjunto de variáveis aleatórias que seja independente dois a dois, mas não mutuamente. De fato, considere três variáveis aleatórias $X$, $Y$ e $Z$, onde $X$ e $Y$ são variáveis de Bernoulli independentes, com probabilidade de sucesso $p = 1/2$, e defina $Z$ como sendo $1$, caso os resultados de $X$ e $Y$ sejam diferentes, e $0$, caso os resultados sejam iguais. Podemos escrever isso como $Z = X + Y \mod 2$, com $X$ e $Y$ assumindo valores $0$ ou $1$. Podemos pensar nisso como um *checksum* simples, ou um dígito verificador.

Nesse caso, $X$ e $Y$ são independentes, $X$ e $Z$ são independentes e $Y$ e $Z$ são independentes. Mas $X, Y$ e $Z$ não são mutuamente independentes, já que $Z$ está completamente determinado pelos resultados de $X$ e $Y$.
