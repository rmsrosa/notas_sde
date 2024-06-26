@def title = "Variáveis aleatórias multivariadas"

# {{ get_title }}

As coisas começam a ficar mais interessantes quando consideramos mais de uma variável aleatória. Para que elas sejam consideradas juntas, é necessário que estejam definidas em um mesmo espaço de probabilidades. Isso aparece de forma natural, como veremos aqui.

## Variáveis aleatórias multivariadas

Uma maneira de pensar uma coleção de variáveis aleatórias é como um vetor $X = (X_1, \ldots, X_n)$ (muitas vezes se considera um vetor coluna, na verdade) cujos elementos estão em um mesmo espaço de probabilidades, digamos $(\Omega, \mathcal{A}, \mathbb{P}).$ Os espaços de eventos podem ser diferentes, de forma que $\Sigma = \Sigma_1 \times \cdots \times \Sigma_n,$ com a $\sigma$-algebra $\mathcal{E}$ gerada por $\mathcal{E}_1 \times \cdots \times \mathcal{E}_n.$ Tal objeto é chamado de **variável aleatória multivariada.** E a probabilidade $\mathbb{P}$ é chamada de **distribuição conjunta de probabilidades.**

A partir da probabilidade conjunta, podemos obter as chances de certas combinações de eventos $E \in \mathcal{E}$ acontecerem:
$$
\mathbb{P}(X \in E).
$$
Quando o evento conjunto é da forma $E = E_1 \times \ldots \times E_n,$ podemos escrever
$$
\mathbb{P}(X_1 \in E_1, \ldots, X_n \in E_n)
$$

Também podemos extrair a probabilidade de realização de um evento para apenas uma das variáveis, que é chamada de **marginal**.
$$
\mathbb{P}(X_i \in E_i).
$$
Isso pode ser obtido da distribuição conjunta, considerando o evento $\mathbb{E} = \Sigma_1 \times \ldots \Sigma_{i-1}\times E_i \times \Sigma_{i+1} \times \cdot \times \Sigma_n.$

## Exemplo

Por exemplo, considere um dado de quatro lados e um de seis. Ambos dados não viciados. Há $4 \times 6 = 24$ combinações possíveis. O espaço amostral $\Omega$ deverá ter (pelo menos) 24 elementos, cada combinação com uma determinada probabilidade.

Podemos representar os resultado dos dados através de duas variáveis aleatórias, digamos $X$ e $Y,$ com $X$ para o resultado do lançamento do dado de quatro lados e $Y,$ para o de seis. Isoladamente, teríamos um espaço amostral de quatro elementos para $X$ e um de seis para $Y.$ Mas em conjunto, temos uma variável multivariada $(X, Y)$ em um espaço amostral de 24 elementos. Mais explicitamente, podemos considerar
$$
\Omega = \Sigma = \{1, \ldots, 4\} \times \{1, \ldots, 6\}.
$$

A probabilidade conjunta $\mathbb{P}$ é o que define a variável multivariada nos dando as probabilidades das realizações de cada combinação:
$$
\mathbb{P}(X = i, Y = j) = \frac{1}{24}, \qquad i = 1, \ldots, 4, \;j = 1, \ldots, 6.
$$
A partir daí, podemos tirar as marginais:
$$
\mathbb{P}(X = i) = \frac{1}{4}, \quad i = 1, \ldots, 4, \qquad \mathbb{P}(Y = j) = \frac{1}{6}, \quad j = 1, \ldots, 6.
$$
As marginais podem ser obtidas com a lei da probabilidade total, por exemplo,
$$
\mathbb{P}(X = i) = \sum_{j = 1}^6 \mathbb{P}(X = i, Y = j) = \sum_{j = 1}^6 \frac{1}{24} = \frac{6}{24} = \frac{1}{4}.
$$

## Independência

Duas variáveis aleatórias $X$ e $Y$ gerando uma variável aleatória multivariada $(X, Y)$ em um espaço $(\Omega, \mathcal{A}, \mathbb{P})$ são ditas **independentes** quando a probabilidade conjunta é o produto das marginais:
$$
\mathbb{P}(X \in E_1, Y \in E_2) = \mathbb{P}(X \in E_1)\mathbb{P}(X \in E_2).
$$

No caso de uma variável multivariada $(X_1, \ldots, X_n),$ dizemos que as variáveis $X_i$ são **(mutuamente) independentes** quando
$$
\mathbb{P}(X_1 \in E_1, \ldots, X_n \in E_n) = \mathbb{P}(X_1 \in E_1)\cdots \mathbb{P}(X_n \in E_n).
$$

Analogamente no caso de uma coleção infinita $\{X_k\}_k$ (enumerável ou não) de variáveis aleatórias em um mesmo espaço.

Essa propriedade pode ser usada diretamente na construção de variáveis multivariadas independentes!

## Independência dois a dois

Dizemos que variáveis aleatórias $X_1, \ldots, X_n$ definindo uma variável multivariada $(X_1, \ldots, X_n)$ são **independentes duas a duas** quando qualquer par $(X_i, X_j)$ é independente, i.e.
$$
\mathbb{P}(X_i \in E_i, X_j \in E_j) = \mathbb{P}(X_i \in E_i)\mathbb{P}(X_j \in E_j), \qquad \forall i \neq j.
$$

Observe que podemos ter um conjunto com mais de duas variáveis aleatórias cujas variáveis sejam independentes dois a dois, mas não mutuamente. De fato, considere três variáveis aleatórias $X,$ $Y$ e $Z,$ onde $X$ e $Y$ são variáveis de Bernoulli independentes, com probabilidade de sucesso $p = 1/2,$ e defina $Z$ como sendo $1,$ caso os resultados de $X$ e $Y$ sejam diferentes, e $0,$ caso os resultados sejam iguais. Podemos escrever isso como $Z = X + Y \mod 2,$ com $X$ e $Y$ assumindo valores $0$ ou $1.$ Podemos pensar nisso como um *checksum* simples, ou um dígito verificador.

Nesse caso, $X$ e $Y$ são independentes, $X$ e $Z$ são independentes e $Y$ e $Z$ são independentes. Mas $X, Y$ e $Z$ não são mutuamente independentes, já que $Z$ está completamente determinado pelos resultados de $X$ e $Y.$

Podemos mostrar isso mais explicitamente, através da distribuição conjunta de probabilidade, até mesmo para solidificar as ideias acima. A tabela abaixo nos dá a distribuição conjunta de probabilidades:

|  X  |  Y  |  Z  | Probabilidade |
|:---:|:---:|:---:|:--------------|
|  0  |  0  |  0  |      1/4      |
|  1  |  0  |  1  |      1/4      |
|  0  |  1  |  0  |      1/4      |
|  1  |  1  |  1  |      1/4      |

O espaço amostral pode ser tomado como sendo $\Omega = \{0, 1\}^3.$ Acima, só mostramos as combinações com probabilidade positiva. Mas podemos completar o quadro:

|  X  |  Y  |  Z  | Probabilidade |
|:---:|:---:|:---:|:--------------|
|  0  |  0  |  0  |      1/4      |
|  0  |  0  |  1  |       0       |
|  1  |  0  |  0  |       0       |
|  1  |  0  |  1  |      1/4      |
|  0  |  1  |  0  |       0       |
|  0  |  1  |  1  |      1/4      |
|  1  |  1  |  0  |      1/4      |
|  1  |  1  |  1  |       0       |

Observe que
$$
\mathbb{P}(X = 0) = \mathbb{P}(Y = 0) = \mathbb{P}(Z = 0) = \frac{1}{4} + \frac{1}{4} = \frac{1}{2}
$$
No entanto,
$$
\mathbb{P}(X = 0, Y = 0, Z = 0) = 0 \neq \mathbb{P}(X = 0)\mathbb{P}(Y = 0)\mathbb{P}(Z = 0).
$$
Da mesma forma, pode-se verificar que as variáveis são independentes duas a duas.

## Desigualdade maximal de Kolmogorov

Como uma aplicação interessante, considere $n$ variáveis aleatórias independentes $X_1, \ldots, X_n$ com $\mathbb{E}[X_k] = 0,$ $k = 1, \ldots, n,$ e defina
$$
    S_k = \sum_{j=1}^k X_j,
$$
com $S_0 = 0.$ Estamos interessados em estimar
$$
    \mathbb{P}\left(\max_{1\leq k \leq n} \{S_k\} \geq r\right),
$$
para $r \geq 0$ arbitrário. Para isso, usamos a decomposição
$$
    \left\{\max_{1\leq k \leq n} \{S_k\} \geq r\right\} = \left\{S_1 \geq r\right\} \bigcup \left\{S_1 < r, S_2 \geq r\right\} \bigcup \cdots \bigcup \left\{S_1 < r, \ldots S_{n-1} < r, S_n \geq r\right\}.
$$
Denotamos
$$
    A_k = \left\{S_1 < r, \ldots S_{k-1} < r, S_k \geq r \right\}.
$$
Como as uniões são disjuntas,
$$
    \mathbb{P}\left(\max_{1\leq k \leq n} \{S_k\} \geq r\right) = \mathbb{P}\left(A_1\right) + \mathbb{P}\left(A_2\right) + \cdots + \mathbb{P}\left(A_n\right)
$$
Usando a desigualdade de Chebyshev,
$$
    \mathbb{P}\left(A_k\right) = \mathbb{E}[\chi_{A_k}] \leq \frac{1}{r^2}\mathbb{E}[S_k^2 \chi_{A_k}] \leq \frac{1}{r^2} \mathbb{E}[(S_k^2 + (S_n - S_k)^2) \chi_{A_k}].
$$
Como as variáveis $X_k,$ $k=1, \ldots, n,$ são independentes, temos que
$$
S_k=\sum_{1\leq j \leq k} X_j \qquad \textrm{e} \qquad  S_n - S_k = \sum_{k < j \leq n} X_j
$$
são independentes entre si. Além disso, $\chi_{A_k}$ só envolve os processos $X_1, \ldots, X_k,$ sendo também independente de $S_n - S_k.$ Desse modo,
$$
    \mathrm{Cov}\left(S_k\chi_{A_k}, S_n - S_k\right) = 0
$$
e
$$
    \mathbb{E}[S_k\chi_{A_k}(S_n - S_k)] = \mathrm{Cov}\left(S_k\chi_{A_k}, S_n - S_k\right) + \mathbb{E}\left[S_k\chi_{A_k}\right]\mathbb{E}\left[S_n - S_k\right] = \mathbb{E}\left[S_k\chi_{A_k}\right]\mathbb{E}\left[S_n - S_k\right].
$$
Observe que $S_k \geq r$ em $A_k,$ logo
$$
    \mathbb{E}\left[S_k\chi_{A_k}\right] \geq r,
$$
mas
$$
    \mathbb{E}\left[S_n - S_k\right] = 0,
$$
de maneira que
$$
    \mathbb{E}[S_k\chi_{A_k}(S_n - S_k)] = 0.
$$

Assim, podemos completar os quadrados e escrever
$$
\begin{align*}
    \mathbb{E}[(S_k^2 + (S_n - S_k)^2) \chi_{A_k}] & = \mathbb{E}[(S_k^2 + 2S_k(S_n - S_k) + (S_n - S_k)^2)\chi_{A_k}] \\
    & = \mathbb{E}[(S_k + (S_n - S_k))^2\chi_{A_k}] \\
    & = \mathbb{E}[S_n^2\chi_{A_k}].
\end{align*}
$$
Desta forma,
$$
    \mathbb{P}\left(\max_{1\leq k \leq n} \{S_k\} \geq r\right) \leq \frac{1}{r^2}\left( \mathbb{E}[S_n^2\chi_{A_1}] + \cdots + \mathbb{E}[S_n^2\chi_{A_n}]\right) = \frac{1}{r^2}\mathbb{E}[S_n^2\left(\chi_{A_1} + \cdots + \chi_{A_n}\right)].
$$
Como os conjuntos $A_1, \ldots, A_n$ são disjuntos, temos
$$
    \chi_{A_1} + \ldots + \chi_{A_n} = \chi_{A_1 \cup \cdots \cup A_n} \leq 1,
$$
de modo que
$$
    \mathbb{E}[S_n^2\chi_{A_1 \cup \ldots \cup A_n}] \leq \mathbb{E}[S_n^2].
$$
Como $S_n$ também tem valor esperado nulo, o lado direito é igual à variância de $S_n,$ nos levando à desigualdade final, conhecida como **desigualdade de Kolmogorov:**
$$
    \mathbb{P}\left(\max_{1\leq k \leq n} \{S_k\} \geq r\right) \leq \frac{1}{r^2}\mathrm{Var}\left(S_n^2\right),
$$
para $r > 0$ arbitrário.

## Exercícios

1. Considere um vetor aleatório $(X_1, \ldots, X_n)$ como na desigualdade maximal de Kolmogorov, com variáveis independentes e assuma, mais geralmente, que, para um dado $m\in\mathbb{N},$ os momentos são finitos, i.e. $\mathbb{E}[X_k^{m}] < \infty,$ $k=1, \ldots, n,$ e que cada $X_k$ é simétrico em relação à origem, ou seja, $X_k$ e $-X_k$ tem a mesma distribuição. Modifique a demonstração acima da desigualdade maximal de Kolmogorov para obter que
$$
    \mathbb{P}\left(\max_{1\leq k \leq n} \{S_k\} \geq r\right) \leq \frac{1}{r^{m}}\mathbb{E}\left[S_n^{m}\right],
$$
para todo $r > 0$ e todo inteiro $m\in\mathbb{N}.$

> *Dicas:*
>
> (i) Substitua a desigualdade de Chebyshev por
>    $ \mathbb{P}\left(A_k\right) = \mathbb{E}[\chi_{A_k}] \leq \frac{1}{r^{m}}\mathbb{E}[S_k^{m} \chi_{A_k}]. $
>
> (ii) Escreva $ S_n^{m} = (S_k + (S_n - S_k))^{m} = \sum_{i=0}^{m} \left( \begin{matrix} m \\ i \end{matrix}\right)S_k^{m - i}(S_n - S_k)^{i}.$
>
> (iii) Quando $i$ é ímpar, segue da simetria de cada $X_j$ que $S_n - S_k$ também é simétrico em relação a origem e, portanto, $\mathbb{E}\left[(S_n - S_k)^i\right] = 0.$ Além disso, $S_n - S_k$ é independente de $S_k^{m - i}\chi_{A_k}.$ Assim, $\mathbb{E}[S_k^{m - i}(S_n - S_k)^{i} \chi_{A_k}] = \mathbb{E}[S_k^{m - i}\chi_{A_k}]\mathbb{E}[(S_n - S_k)^{i}] = 0.$
>
> (iv) Quando $i$ é par, temos $(S_n - S_k)^i \geq 0.$ Além disso, $S_k \geq r > 0$ em $A_k,$ de modo que $S_k^{m - i}\chi_{A_k} \geq 0.$ Portanto, $\mathbb{E}[S_k^{m - i}(S_n - S_k)^{i} \chi_{A_k}] \geq 0.$
>
> (v) Mantendo apenas o termo $i=0$ e descartando os outros que se anulam ou são não-negativos, obtemos $\mathbb{E}[S_n^{m} \chi_{A_k}] \geq \mathbb{E}[S_k^{m}\chi_{A_k}].$
>
>  (vi) Isso nos dá que $\mathbb{P}\left(A_k\right) = \mathbb{E}[\chi_{A_k}] \leq \frac{1}{r^{m}}\mathbb{E}[S_k^{m} \chi_{A_k}] \leq \frac{1}{r^{m}}\mathbb{E}[S_n^{m} \chi_{A_k}].$
>
> (vii) Somando em $k=1, \ldots, n$ e usando que os conjuntos $A_1, \ldots, A_n$ são disjuntos, como na demonstração acima, obtemos, finalmente, a desigualdade desejada.

2. Sob as condições do exercício anterior, assume, ainda, que $\mathbb{E}[e^{X_k}] < \infty,$ para todo $k=1, \ldots, n.$ Mostre que
$$
    \mathbb{P}\left(\max_{1\leq k \leq n} \{S_k\} \geq r\right) \leq e^{-\lambda r}\mathbb{E}\left[e^{\lambda S_n}\right],
$$
para $r > 0$ e $\lambda \geq 0$ quaisquer. *Dica: use o resultado anterior em uma série de potências.*
