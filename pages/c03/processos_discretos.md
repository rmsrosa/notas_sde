@def title = "Processos discretos"

# {{ get_title }}

A nossa intenção principal é trabalhar com processos contínuos, já que equações diferenciais estocásticas e aleatórias envolvem variáveis independentes contínuas, gerando, portanto, processos contínuos. Mas é ilustrativo iniciar os estudos de processos estocásticos com processos discretos. Além disso, alguns processos estocásticos contínuos aparecem naturalmente como limites de processos discretos.

## Processo de Bernoulli em tempo finito

Vamos começar com um processo de Bernoulli em um tempo discreto e finito $I = \{1, 2, \ldots, N\}$, onde $N \in \mathbb{N}$. Há dois estados possíveis, digamos $\Sigma = \{0, 1\}$, indicando, por exemplo, o resultado do lançamento de uma moeda ("coroa" ou "cara") ou de um teste de laboratório ("negativo", "positivo").

A cada passo, um *teste de Bernoulli* é feito, dando um resultado $1$, com probabilidade $p$, ou $0$, com probabilidade $1 - p$, onde $0 < p \leq 1$. Assumimos que os testes sejam independentes, ou seja, o resultado do teste em um passo $n_1$ independe do resultado do teste no instante $n_2$.

Fazemos o teste $N$ vezes, obtendo uma sequência de resultados $x = (x_1, \ldots, x_N)$, onde $x_n \in \Sigma = \{0, 1\}$. O conjunto de possíveis sequências forma o espaço amostral $\Omega = \{0, 1\}^N$. Há $2^N$ sequências possíveis. Se $i = \#\{n; \; x_n = 1\}$ denota o número de vezes em que o resultado é $1$ e $j = \#\{n; \; x_n = 0\}$, o número de vezes em que o resultado é $0$, então $i + j = n$ e a probabilidade dessa sequência $x$ ocorrer é
$$
\mathbb{P}(X = x) = p^i(1-p)^{n-i}, \qquad i = \#\{n; \; x_n = 1\}.
$$

Podemos interpretar o resultado do teste de Bernoulli em cada passo $n$ como uma variável aleatória $X_n$ nesse espaço $(\Sigma, \mathcal{A}, \mathbb{P})$. A sequência $\{X_n\}_{n = 1, \ldots, N}$ é um processo aleatório discreto. Um determinado resultado no instante $n$ tem probabilidades
$$
\mathbb{P}(X_n = 1) = \mathbb{P}(\{x \in \Omega; x_n = 1\}) = p,
$$
e
$$
\mathbb{P}(X_n = 0) = \mathbb{P}(\{x \in \Omega; x_n = 0\}) = 1 - p.
$$

A distribuição de probabilidades de $X_n$ é igual a de um único teste de Bernoulli. Podemos escrever
$$
X_n \sim \mathrm{Bernoulli}(p),
$$
onde $\mathrm{Bernoulli}(p)$ é a distribuição de Bernoulli com probabilidade de sucesso $p$.

Mas enquanto um teste de Bernoulli isolado pode ser pensado como uma variável aleatória no espaço amostral $\{0, 1\}$, o processo gerado por $N$ testes de Bernoulli é pensado como sendo definido no espaço de trajetórias. Além disso, dessa forma, podemos considerar probabilidades conjuntas. Por exemplo, no caso do resultado dos testes em dois instantes diferentes, temos
$$
\mathbb{P}(X_{n_1} = e_1, X_{n_2} = e_2) = \mathbb{P}(\{x \in \Omega; x_{n_1} = e_1, \;x_{n_2} = e_2\}) = p_1p_2,
$$
onde $p_n = p$, se $e_n = 1$, ou $p_n = 1 - p$, se $e_n = 0$.

## Processo de Bernoulli em tempo infinito

Podemos, também, fazer um número infinito de testes de Bernoulli. Nesse caso, $I = \mathbb{N}$ e obtemos um processo $\{X_n\}_{n\in \mathbb{N}}$, onde, a cada $n$, $X_n$ indica o resultado de um teste de Bernoulli. Como antes, $\{X_n\}_{n\in \mathbb{N}}$ é um processo estacionário e independente, com
$$
X_n \sim \mathrm{Bernoulli}(p).
$$

O espaço amostral também pode ser pensado como sendo o espaço de possíveis trajetórias,
$$
\Omega = \{0, 1\}^\mathbb{N} = \{x:\mathbb{N} \rightarrow \{0, 1\}\} = \{x = (x_1, x_2, \ldots); \; x_n = 0 \textrm{ ou } 1, \; n\in \mathbb{N}\}.
$$

Nesse caso, no entanto, esse espaço tem cardinalidade infinita. Mais precisamente, $\#2^\mathbb{N} = 2^{\aleph_0} = \aleph_1$, que não é enumerável. A probabilidade de observamos uma sequência em particular é, portanto, necessariamente nula! Mas podemos observar conjuntos de sequências, em particular conjuntos que tenham uma mesma sequência finita. Isso é uma probabilidade conjunta, digamos
$$
\mathbb{P}(X_{n_1} = e_1, \ldots X_{n_N} = e_N) = \mathbb{P}(\{x = (x_1, x_2, \ldots) \in \{0, 1\}^\mathbb{N}; \; x_{n_1} = e_1, \ldots, x_{n_N} = e_N) \\ = p^i(1-p)^{N-1},
$$
onde $i = \#\{n \in \{n_1, \ldots, n_N\}; \; x_n = 1\}$.

## Caminho aleatório

Nesse caso, $I = \mathbb{Z}^* = \{0, 1, 2, \ldots\}$, o conjunto de estados possíveis é $\Sigma = \mathbb{Z}$ e o espaço amostral pode ser tomado como $\Omega = \Sigma^{\mathbb{Z}^*} = \{x = (x_0, x_1, x_2, \ldots); \; x_n \in \mathbb{Z}, n = 0, 1, 2, \ldots\}$. Novamente, $\Omega$ é incontável e a probabilidade da realização de cada trajetória específica é nula. Mas podemos deduzir a probabilidade do caminho passar pela posição $m$, em um determinado instante $n$:
$$
\mathbb{P}(X_n = m) = \begin{cases}
  \displaystyle \frac{1}{2^n} \left(\begin{matrix} n \\ \frac{n + m}{2} \end{matrix}\right), & |m| \leq n \text{ e $m$ e $n$ com a mesma paridade} \\
  0, & |m| > n \text{ e/ou $m$ e $n$ com paridades diferentes.}
\end{cases}
$$

Saber a posição da partícula no instante $n$ nos dá a distribuição de probabilidades para a posiçãm em $n+1$, o que podemos escrever na forma
$$
\mathbb{P}(X_{n+1} = k | X_n = m) = \begin{cases} \displaystyle \frac{1}{2}, & k = m \pm 1, \\ 0, & k \neq m \pm 1. \end{cases}
$$

## Urna sem recomposição

Imagine um saco com cinco bolinhas vermelhas e cinco bolinhas pretas. Imagine, agora, retirarmos as dez bolinhas do saco, uma a uma. Seja $X_n$ a variável aleatória indicando a cor da bolinha retirada na $n$-ésima vez. Digamos que $X_n = 1$ para uma bolinha vermelha e $X_n = 2$ para uma bolinha preta. Isso nos leva a um processo estocástico $\{X_n\}_{n=1, \ldots, 2N}$, em $I=\{1, \ldots, 2N\}$, onde $N = 5$ é o número inicial de cada bolinha. Podemos considerar o espaço amostral como sendo $\Omega = \{1, 2\}^N$, com $\#\Omega = 2^{10} = 1024$ trajetórias possíveis.

Na primeira retirada, temos números iguais de bolinhas de cada cor, de modo que a probabilidade de cada uma sair é igual:
$$
\mathbb{P}(X_1 = 1) = \mathbb{P}(X_1 = 2) = \frac{1}{2}.
$$
Já nas retiradas seguintes, no entanto, as chances de cada uma vão mudar de acordo com quais bolinhas já foram retiradas. No segundo passo, se a primeira bolinha retirada foi preta, então sobraram cinco bolinhas vermelhas e quatro pretas, de maneira que as chances de tirarmos outra preta são de 4/9 enquanto que as chances de tirarmos uma vermelha são de 5/9. Analogamente, caso a primeira bolinha retirada tenha sido vermelha. Podemos escrever isso em termos de probabilidades condicionadas:
$$
\mathbb{P}(X_2 = 1 | X_1 = 1) = \mathbb{P}(X_2 = 2 | X_1 = 2) = \frac{4}{9}, \quad \mathbb{P}(X_2 = 1 | X_1 = 2) = \mathbb{P}(X_2 = 2 | X_1 = 1) = \frac{5}{9}.
$$
Após o passo $n$, com $1 \leq n \leq 2N$, se foram retiradas $i$ bolinhas vermelhas e $n - i$ bolinhas pretas, então as chances de tirarmos uma bolinha vermelha ou uma bolinha preta no passo $n+1$ são, respectivamente,
$$
\frac{N - i}{2N - n} \quad \text{e} \quad \frac{N - n + i}{2N - n}. 
$$
Podemos escrever isso em termos de probabilidade condicionada, em função de todas as retiradas passadas:
$$
\mathbb{P}(X_{n + 1} = x_{n+1} | X_1 = x_1, \ldots, X_n = x_n) = \frac{N - \#\{x_i = x_{n+1}; \; i = 1, \ldots, n\}}{2N - n}.
$$

Isso não nos impede de calcularmos a probabilidade de termos um certo resultado sem sabermos estados anteriores. Basta somarmos todas as possibilidades até o momento desejado. Ou seja, podemos contar todas as possibilidades de todas as bolas retiradas terem sido vermelhas, depois de todas menos um, até nenhuma.

Por exemplo, vamos buscar encontrar $\mathbb{P}(X_2 = 1)$. Temos
$$
\mathbb{P}(X_2 = 1) = \mathbb{P}(X_2 = 1 | X_1 = 1)\mathbb{P}(X_1 = 1) + \mathbb{P}(X_2 = 1 | X_1 = 2)\mathbb{P}(X_1 = 2) = \frac{4}{9}\times \frac{1}{2} + \frac{5}{9}\times\frac{1}{2} = \frac{1}{2}.
$$
Da mesma forma, $\mathbb{P}(X_2 = 2) = 1/2$. Agora, quando a $X_3$, temos
$$
\mathbb{P}(X_3 = 1) = \mathbb{P}(X_3 = 1 | X_2 = 1)\mathbb{P}(X_2 = 1) + \mathbb{P}(X_3 = 1 | X_2 = 2)\mathbb{P}(X_2 = 2).
$$
Temos, ainda,
$$
\mathbb{P}(X_3 = 1 | X_2 = 1) = \mathbb{P}(X_3 = 1 | X_2 = 1, X_1 = 1)\mathbb{P}(X_1 = 1) + \mathbb{P}(X_3 = 1 | X_2 = 1, X_1 = 2)\mathbb{P}(X_1 = 2) \\
= \frac{3}{8}\times\frac{1}{2} + \frac{4}{8}\times \frac{1}{2} = \frac{7}{16}
$$
e
$$
\mathbb{P}(X_3 = 1 | X_2 = 2) = \mathbb{P}(X_3 = 1 | X_2 = 2, X_1 = 1)\mathbb{P}(X_1 = 1) + \mathbb{P}(X_3 = 1 | X_2 = 2, X_1 = 2)\mathbb{P}(X_1 = 2) \\
= \frac{4}{8}\times\frac{1}{2} + \frac{5}{8}\times \frac{1}{2} = \frac{9}{16}.
$$
Logo,
$$
\mathbb{P}(X_3 = 1) = \frac{7}{16}\frac{1}{2} + \frac{9}{16}\frac{1}{2} = \frac{1}{2}.
$$
Analogamente,
$$
\mathbb{P}(X_3 = 2) = \frac{1}{2}.
$$

De fato, $\mathbb{P}(X_n = 1) = \mathbb{P}(X_n = 2) = 1/2$, para qualquer $n = 1, \ldots, 2N$. Basta pensar que, por simetria (as probabilidades devem ser as mesmas para cada cor de bolinha, já que não há viés para nenhuma delas), $\mathbb{P}(X_n = 1) = \mathbb{P}(X_n = 2)$. Além disso, a soma delas deve ser $1$. Portanto, a única opção é cada uma ter probabilidade meio.

Observe, então, que as seguintes probabilidades são diferentes:
$$
\mathbb{P}(X_3 = 1) = \frac{1}{2}, \quad \mathbb{P}(X_3 = 1 | X_2 = 1) = \frac{4}{9}, \quad \mathbb{P}(X_3 = 1 | X_2 = 1, X_1 = 1) = \frac{3}{8}.
$$
