@def title = "Variáveis aleatórias multivariadas"

# {{ get_title }}

As coisas começam a ficar mais interessantes quando consideramos mais de uma variável aleatória. Para que elas sejam consideradas juntas, é necessário que estejam definidas em um mesmo espaço de probabilidades. Isso aparece de forma natural, como veremos aqui.

## Variáveis aleatórias multivariadas

Uma maneira de pensar uma coleção de variáveis aleatórias é como um vetor $\mathbf{X} = (X_1, \ldots, X_n)$ (muitas vezes se considera um vetor coluna, na verdade) cujos elementos estão em um mesmo espaço de probabilidades, digamos $(\Omega, \mathcal{A}, \mathbb{P})$. Os espaços de eventos podem ser diferentes, de forma que $\Sigma = \Sigma_1 \times \cdots \times \Sigma_n$, com a $\sigma$-algebra $\mathcal{E}$ gerada por $\mathcal{E}_1 \times \cdots \times \mathcal{E}_n$. Tal objeto é chamado de **variável aleatória multivariada.** E a probabilidade $\mathbb{P}$ é chamada de **distribuição conjunta de probabilidades.**

A partir da probabilidade conjunta, podemos obter as chances de certas combinações de eventos $\mathbb{E} \in \mathcal{E}$ acontecerem:
$$
\mathbb{P}(\mathbb{X} \in \mathbb{E}).
$$
Quando o evento conjunto é da forma $\mathbb{E} = E_1 \times \ldots \times E_n$, podemos escrever
$$
\mathbb{P}(X_1 \in E_1, \ldots, X_n \in E_n)
$$

Também podemos extrair a probabilidade de realização de um evento para apenas uma das variáveis, que é chamada de **marginal**.
$$
\mathbb{P}(X_i \in E_i).
$$
Isso pode ser obtido da distribuição conjunta, considerando o evento $\mathbb{E} = E_1 \times \ldots \times E_n$, com $E_j = \Sigma_j$, para $i\neq j$.

## Exemplo

Por exemplo, considere um dado de quatro lados e um de seis. Ambos dados não viciados. Há $4 \times 6 = 24$ combinações possíveis. O espaço amostral $\Omega$ deverá ter (pelo menos) 24 elementos, cada combinação com uma determinada probabilidade.

Podemos representar os resultado dos dados através de duas variáveis aleatórias, digamos $X$ e $Y$, com $X$ para o resultado do lançamento do dado de quatro lados e $Y$, para o de seis. Isoladamente, teríamos um espaço amostral de quatro elementos para $X$ e um de seis para $Y$. Mas em conjunto, temos uma variável multivariada $(X, Y)$ em um espaço amostral de 24 elementos. Mais explicitamente, podemos considerar
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

No caso de uma variável multivariada $(X_1, \ldots, X_n)$, dizemos que as variáveis $X_i$ são **(mutuamente) independentes** quando
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

Observe que podemos ter um conjunto com mais de duas variáveis aleatórias cujas variáveis sejam independentes dois a dois, mas não mutuamente. De fato, considere três variáveis aleatórias $X$, $Y$ e $Z$, onde $X$ e $Y$ são variáveis de Bernoulli independentes, com probabilidade de sucesso $p = 1/2$, e defina $Z$ como sendo $1$, caso os resultados de $X$ e $Y$ sejam diferentes, e $0$, caso os resultados sejam iguais. Podemos escrever isso como $Z = X + Y \mod 2$, com $X$ e $Y$ assumindo valores $0$ ou $1$. Podemos pensar nisso como um *checksum* simples, ou um dígito verificador.

Nesse caso, $X$ e $Y$ são independentes, $X$ e $Z$ são independentes e $Y$ e $Z$ são independentes. Mas $X, Y$ e $Z$ não são mutuamente independentes, já que $Z$ está completamente determinado pelos resultados de $X$ e $Y$.

Podemos mostrar isso mais explicitamente, através da distribuição conjunta de probabilidade, até mesmo para solidificar as ideias acima. A tabela abaixo nos dá a distribuição conjunta de probabilidades:

|  X  |  Y  |  Z  | Probabilidade |
|:---:|:---:|:---:|:--------------|
|  0  |  0  |  0  |      1/4      |
|  1  |  0  |  1  |      1/4      |
|  0  |  1  |  0  |      1/4      |
|  1  |  1  |  1  |      1/4      |

O espaço amostral pode ser tomado como sendo $\Omega = \{0, 1\}^3$. Acima, só mostramos as combinações com probabilidade positiva. Mas podemos completar o quadro:

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
