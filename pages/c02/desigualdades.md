@def title = "Igualdades e desigualdades"

# {{ get_title }}

Vejamos alguns resultados importantes em probabilidade que nos serão úteis ao longo da matéria.

## Lei da probabilidade condicionada

Se $A$ e $B$ são conjuntos mensuráveis segundo uma medida de probabilidade $\mathbb{P}$ e $\mathbb{P}(B) > 0$, então vale a fórmula
$$
\mathbb{P}(A | B) = \frac{\mathbb{P}(A \cap B)}{\mathbb{B}}.
$$

Caso $\mathbb{P}(B) = 0$, então $\mathbb{P}(A | B)$ é considerado *indefinido*.

Por exemplo, seja $X$ uma variável aleatória com distribuição uniforme em $\Sigma = \{1, 2, \ldots, 9\}$. Desses, $\{2, 4, 6, 8\}$ são pares e $\{3, 6, 9\}$ são múltiplos de $3$. Assim,
$$
\mathbb{P}(X \textrm{ é par}) = \frac{4}{9} \quad \mathbb{P}(X \textrm{ é múltiplo de 3}) = \frac{3}{9} = \frac{1}{3}, \quad \mathbb{P}(X \textrm{ é par e múltiplo de 3}) = \frac{1}{9}.
$$
Agora, sabendo-se que $X$ é múltiplo de $3$, quais as chances de $X$ ser par? Naturalmente, temos uma única possibilidade em três: $\{6\}$ em $\{3, 6, 9\}$, ou seja,
$$
\mathbb{P}(X \textrm{ é par } | X \textrm{ é múltiplo de 3}) = \frac{1}{3}.
$$
Agora, usando a lei de probabilidade condicionada,
$$
\mathbb{P}(X \textrm{ é par } | X \textrm{ é múltiplo de 3}) = \frac{\mathbb{P}(X \textrm{ é par e múltiplo de 3})}{\mathbb{P}(X \textrm{ é múltiplo de 3})} = \frac{\displaystyle\frac{1}{9}}{\displaystyle\frac{1}{3}} = \frac{3}{9} = \frac{1}{3}.
$$
E quais as chances de $X$ ser múltiplo de três dado que é par?

## Eventos independentes

Quando as chances de um evento $A$ acontecer independe de um outro evento $B$, podemos expressar isso por
$$
\mathbb{P}(A | B) = \mathbb{P}(A).
$$
Pela lei de probabilidade condicionada, se $\mathbb{P}(B) > 0$, temos, então, que
$$
\mathbb{P}(A) = \mathbb{P}(A | B) = \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)},
$$
ou seja,
$$
\mathbb{P}(A \cap B) = \mathbb{P}(A)\mathbb{P}(B).
$$
Se $\mathbb{P}(B) = 0$, a igualdade acima é trivialmente válida.

Se tivermos dois dados de seis faces, $A$ e $B$, com faces numeradas de $1$ a $6$, e $X$ é a variável aleatória obtida pelo resultado do lançamento de um dos dados escolhidos aleatoriamente com igual probabilidade, então as chances de tirarmos $3$ independe da escolha do dado. Já se um dos dados tem apenas quatro faces, numeradas de $1$ a $3$, então as chances de tirarmos $3$ depende da escolha do dado.

## Lei da probabilidade total

Um resultado importante em probabilidade pode ser interpretado como uma estratégia de *dividir para conquistar*. Digamos que $\mathbb{P}$ seja uma medida de probabilidade em um espaço amostral $\Omega$. Suponha que queiramos saber a medida de um determinado conjunto $A$. Suponha, ainda, que seja razoável dividir o espaço em subconjuntos disjuntos $B_1, \ldots, B_k$, ou seja, $\Omega = \cup_{j = 1}^k B_j$ e $B_i \cap B_j = \emptyset$, $i\neq j$, $i, j = 1, \ldots, k$. Então, vale a **lei de probabilidade total**
$$
\mathbb{P}(A) = \mathbb{P}(A \cap B_1) + \ldots + \mathbb{P}(A \cap B_2).
$$
Juntando com a lei de probabilidade condicionada, podemos escrever
$$
\mathbb{P}(A) = \mathbb{P}(A | B_1)\mathbb{P}(B_1) + \ldots + \mathbb{P}(A | B_2)\mathbb{B_2}.
$$

Considerando, novamente, a variável aleatória uniformemente distribuída nos dígitos $\{1, 2, \ldots, 9\}$, temos
$$
\mathbb{P}(X \textrm{ é múltiplo de 3}) = \mathbb{P}(X \textrm{ é par múltiplo de 3}) + \mathbb{P}(X \textrm{ é ímpar múltiplo de 3}) = \frac{1}{9} + \frac{2}{9} = \frac{3}{9} = \frac{1}{3}.
$$
Ou, usando probabilidade condicionada,
$$
\mathbb{P}(X \textrm{ é múltiplo de 3}) \\
= \mathbb{P}(X \textrm{ é múltiplo de 3} | X \textrm{ é par })\mathbb{P}(X \textrm{ é par}) + \mathbb{P}(X \textrm{ é múltiplo de 3} | X \textrm{ é ímpar })\mathbb{P}(X \textrm{ é ímpar}) \\
= \frac{1}{4}\times\frac{4}{9} + \frac{2}{5}\times\frac{5}{9} = \frac{1}{9} + \frac{2}{9} = \frac{1}{3}.
$$

## Exercício

1. Mostre, na lei de probabilidade total, que basta que $\mathbb{P}(B_1 \cup \cdots \cup B_k) = 1$ e $\mathbb{P}(B_i \cap B_j) = 0$, para $i, j = 1, \ldots, k$, com $i \neq j$.

1. Em um torneio de xadrez, podemos classificar os jogadores em níveis A, B e C. Além de você, há 3 jogadores de nível A, 4 de nível B e 8 de nível C. O seu primeiro oponente é sorteado aleatoriamente dentre esses. As suas chances de vitória são $\mathbb{P}(\textrm{vitória} | \textrm{oponente nível A}) = 0.5$, $\mathbb{P}(\textrm{vitória} | \textrm{oponente nível B}) = 0.65$ e $\mathbb{P}(\textrm{vitória} | \textrm{oponente nível C}) = 0.8$. Quais as suas chances de vitória no primeiro jogo?
