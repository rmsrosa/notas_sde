@def title = "Probabilidade condicionada"

# {{ get_title }}

O conceito de probabilidade condicionada é fundamental. Invariavelmente, quando queremos saber a probabilidade de um determinado evento acontecer, temos outras informações à nossa disposição que podemos aproveitar.

## Conceito

A probabilidade condicionada diz respeito à probabilidade de um determinado evento ser realizado, assumindo-se a realização de um outro evento. A probabilidade de um determinado evento $A$ dado a realização de um outro evento $B$ é denotada por
$$
P(A | B).
$$

Note que isso é diferente da probabilidade conjunta $A \cap B.$ De fato, se $A$ for o espaço $\Omega$ todo, então a probabilidade de $\Omega$ deve ser um. Ou seja, $\mathbb{P}(\Omega | B) = 1.$ Por outro lado, $\mathbb{P}(\Omega \cap B) = \mathbb{P}(B).$

Podemos ver a probabilidade condicionada a um evento $B$ como uma fração da probabilidade do evento $B$ ocorrer:
$$
\mathbb{P}(A | B) = \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}.
$$

É claro que é necessário que $\mathbb{P}(B) > 0$ para essa fórmula valer. Essa fórmula é conhecida como a **lei da probabilidade condicionada.**

A definição, propriamente, de probabilidade condicionada é bem mais delicada. Veremos isso posteriormente. No momento, vamos seguir com a intuição.

## Exemplos

Seja $X$ uma variável aleatória com distribuição uniforme em $\Sigma = \{1, 2, \ldots, 9\}.$ Desses, $\{2, 4, 6, 8\}$ são pares e $\{3, 6, 9\}$ são múltiplos de $3.$ Assim,
$$
\mathbb{P}(X \textrm{ é par}) = \frac{4}{9}, \quad \mathbb{P}(X \textrm{ é múltiplo de 3}) = \frac{3}{9} = \frac{1}{3}, \quad \mathbb{P}(X \textrm{ é par e múltiplo de 3}) = \frac{1}{9}.
$$
Agora, sabendo-se que $X$ é múltiplo de $3,$ quais as chances de $X$ ser par? Naturalmente, temos uma única possibilidade em três: $\{6\}$ em $\{3, 6, 9\},$ ou seja,
$$
\mathbb{P}(X \textrm{ é par } | X \textrm{ é múltiplo de 3}) = \frac{1}{3}.
$$
Podemos obter esse mesmo resultado através da lei da probabilidade condicionada:
$$
\mathbb{P}(X \textrm{ é par } | X \textrm{ é múltiplo de 3}) = \frac{\mathbb{P}(X \textrm{ é par e múltiplo de 3})}{\mathbb{P}(X \textrm{ é múltiplo de 3})} = \frac{\displaystyle\frac{1}{9}}{\displaystyle\frac{1}{3}} = \frac{3}{9} = \frac{1}{3}.
$$
E quais as chances de $X$ ser múltiplo de três dado que é par?

Um outro exemplo importante em que podemos usar probabilidade condicionada é em testes clínicos, como a da eficácia de vacinas, que ficou tanto em evidência com a Covid-19. Considere um certo número de voluntários, digamos 1000, envolvidos em um certo ensaio clínico. Desses, 500 seguem o tratamento e 500 tomam placebo. Dos que tomam placebo, 20 desenvolvem sintomas da doença. Dos que seguem o tratamento, apenas 5 desenvolvem sintomas. Isso pode ser representado pela tabela a seguir.

|                | adoecem (A)  | não adoecem  |
|:---------------|:------------:|:------------:|
| tratamento (B) |      5       |     495      |
| placebo        |     40       |     460      |

No total, temos $1000$ voluntários, sendo que $25$ desse total adoecem e apenas $5$ seguem o tratamento e adoecem. Denotando por $A$ o evento de adoecer e por $B$ o de seguir o tratamento, podemos escrever
$$
\mathbb{P}(A \cap B) = \frac{5}{1000}, \quad \mathbb{P}(B) = \frac{500}{1000}.
$$
Com isso, podemos obter a probabilidade de alguém adoecer fazendo o tratamento:
$$
\mathbb{P}(A | B) = \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)} = \frac{\displaystyle \frac{5}{1000}}{\displaystyle \frac{500}{1000}} = \frac{5}{500} = 1\%.
$$

Também podemos visualizar isso completando a tabela com os totais:

|                | adoecem (A)  | não adoecem  | total |
|:---------------|:------------:|:------------:|:-----:|
| tratamento (B) |      5       |     495      |  500  |
| placebo        |     40       |     460      |  500  |
| total          |     45       |     975      | 1000  |

Vemos, diretamente, na primeira coluna, que $5$ adoceram dentre os $500$ que fizeram o tratamento, ou seja, há $5/500 = 1\%$ de chance de adoecer se seguirmos o tratamento. Da mesma forma, sem tratamento, temos $40/500 = 8\%$ de chances de adoecer. Nesse caso, podemos dizer que o tratamento reduziu de $8\%$ a $1\%$ as chances de adoecer. Ou seja, houve uma redução relativa de $(8\% - 1\%)/8\% = 7/8 = 87,5\%.$

## Eventos independentes

Quando as chances de um evento $A$ acontecer independem de um outro evento $B,$ podemos expressar isso por
$$
\mathbb{P}(A | B) = \mathbb{P}(A).
$$
Essa propriedade é recíproca, ou seja, $A$ independe de $B$ se, e somente se, $B$ independe de $A,$ com
$$
\mathbb{P}(B | A) = \mathbb{P}(B).
$$

Observe que, pela lei da probabilidade condicionada, se $\mathbb{P}(B) > 0,$ então, que
$$
\mathbb{P}(A) = \mathbb{P}(A | B) = \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)},
$$
ou seja, assumindo-se $\mathbb{P}(B) > 0,$ temos a caracterização
$$
\mathbb{P}(A | B) = \mathbb{P}(A) \quad \Leftrightarrow \quad \mathbb{P}(A \cap B) = \mathbb{P}(A)\mathbb{P}(B).
$$

Da mesma forma, se $\mathbb{P}(A) > 0,$ então, 
$$
\mathbb{P}(B | A) = \mathbb{P}(B) \quad \Leftrightarrow \quad \mathbb{P}(B \cap A) = \mathbb{P}(B)\mathbb{P}(A).
$$

Em particular, se $\mathbb{P}(A), \mathbb{P}(B) > 0,$ então
$$
\mathbb{P}(A | B) = \mathbb{P}(A) \quad \Leftrightarrow \quad \mathbb{P}(A \cap B) = \mathbb{P}(A)\mathbb{P}(B) \quad \Leftrightarrow \quad \mathbb{P}(B | A) = \mathbb{P}(B).
$$

Por exemplo, as chances do resultado de um dado não viciado de seis faces dar um número menor ou igual a quatro é independente do número ser par ou ímpar e é sempre igual a dois terços. Já as chances do número ser menor ou igual a três depende: é igual a meio, se não soubermos a sua paridade, é igual a um terço, se o número for par, é igual a dois terços, se o número for ímpar.

## Lei da probabilidade total

Um resultado importante em probabilidade pode ser interpretado como uma estratégia de *dividir para conquistar*. Digamos que $\mathbb{P}$ seja uma medida de probabilidade em um espaço amostral $\Omega.$ Suponha que queiramos saber a medida de um determinado conjunto $A.$ Suponha, ainda, que seja razoável dividir o espaço em subconjuntos disjuntos $B_1, \ldots, B_k,$ ou seja, $\Omega = \cup_{j = 1}^k B_j$ e $B_i \cap B_j = \emptyset,$ $i\neq j,$ $i, j = 1, \ldots, k.$ Então, vale a **lei da probabilidade total**
$$
\mathbb{P}(A) = \mathbb{P}(A \cap B_1) + \ldots + \mathbb{P}(A \cap B_k).
$$
Juntando com a lei da probabilidade condicionada, podemos escrever
$$
\mathbb{P}(A) = \mathbb{P}(A | B_1)\mathbb{P}(B_1) + \ldots + \mathbb{P}(A | B_k)\mathbb{P}(B_k).
$$

Considerando, novamente, a variável aleatória uniformemente distribuída nos dígitos $\{1, 2, \ldots, 9\},$ temos
$$
\mathbb{P}(X \textrm{ é múltiplo de 3}) = \mathbb{P}(X \textrm{ é par múltiplo de 3}) + \mathbb{P}(X \textrm{ é ímpar múltiplo de 3}) = \frac{1}{9} + \frac{2}{9} = \frac{3}{9} = \frac{1}{3}.
$$
Ou, usando probabilidade condicionada,
$$
\begin{align*}
\mathbb{P}(X \textrm{ é múltiplo de 3})
& = \mathbb{P}(X \textrm{ é múltiplo de 3} | X \textrm{ é par })\mathbb{P}(X \textrm{ é par}) \\
& \qquad + \mathbb{P}(X \textrm{ é múltiplo de 3} | X \textrm{ é ímpar })\mathbb{P}(X \textrm{ é ímpar}) \\
& = \frac{1}{4}\times\frac{4}{9} + \frac{2}{5}\times\frac{5}{9} = \frac{1}{9} + \frac{2}{9} \\
& = \frac{1}{3}.
\end{align*}
$$

Seguindo na linha de ensaios clínicos, digamos que haja um novo teste para a detecção de alguma doença endêmica que, estima-se, atinge 1% da população. Ensaios clínicos indicam que o teste possui 96% de acerto, ou seja, que, em cada 100 pessoas com a doença, o teste dá resultado positivo em 96 delas. E que ele tem 0,1% de falsos positivos. Ou seja, de cada 1000 pessoas sem a doença, o teste dá positivo em 1 delas. Se uma pessoa qualquer faz o teste, quais as chances dela testar positivo, independentemente de ter ou não a doença?

Vejamos. Se $D$ indica o evento de se ter a doença e $P,$ do evento do teste dar positivo, a lei da probabilidade total nos diz que
$$
\mathbb{P}(P) = \mathbb{P}(P | D)\mathbb{P}(D) + \mathbb{P}(P | \neg D)\mathbb{\neg D},
$$
onde $\neg D$ é o complemento de $D,$ ou seja, nesse caso, representa não ter a doença. As informações nos dizem que
$$
\mathbb{P}(P | D) = 0.96, \qquad \mathbb{P}(P | \neg D) = 0.001, \qquad \mathbb{P}(D) = 0.01.
$$
Além disso,
$$
\mathbb{P}(\neg D) = 1 - \mathbb{P}(A) = 0.99.
$$

Portanto, as chances de uma pessoa qualquer testar positivo é de
$$
\mathbb{P}(P) = 0.96 \times 0.01 + 0.001 \times 0.99 = 0.01059.
$$
Ou seja, as chances de uma pessoa qualquer testar positivo são de 1,059%.

## Teorema de Bayes

Dados dois eventos $A$ e $B$ com probabilidade positiva, temos que
$$
\mathbb{P}(A | B) = \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}
$$
e
$$
\mathbb{P}(B | A) = \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(A)}.
$$
Substituindo, na primeira identidade, a expressão para $\mathbb{P}(A \cap B)$ obtida da segunda identidade, obtemos o resultado do **Teorema de Bayes:**
$$
\mathbb{P}(A | B) = \frac{\mathbb{P}(B | A)\mathbb{P}(A)}{\mathbb{P}(B)}.
$$

O Teorema de Bayes tem inúmeras aplicações. Pensemos, novamente, no exemplo do ensaio clínico acima, de um teste com 96% de acerto para alguma doença endêmica que atinge 1% da população, com 0,1% de falsos positivos. Se uma pessoa qualquer testar positivo, quais as chances dela realmente estar com a doença?

Vejamos. Se $D$ indica o evento de se ter a doença e $T,$ o evento do teste dar positivo, então a probabilidade de se ter a doença dado que o teste deu positivo é representada por $\mathbb{P}(D | T).$ De acordo com o Teorema de Bayes, 
$$
\mathbb{P}(D | T) = \frac{\mathbb{P}(T | D)\mathbb{P}(D)}{\mathbb{P}(T)}.
$$
Sabemos que $\mathbb{P}(T | D) = 0.96$ e que $\mathbb{P}(D) = 0.01.$ Vimos, também, usando a lei da probabilidade total, que $\mathbb{P}(T) = 0.01059.$ Logo,
$$
\mathbb{P}(A | B) = \frac{0.96 \times 0.01}{0.01059} \approx 0.9065
$$
Ou seja, as chances de alguém que testou positivo realmente ter a doença são de 90,65%.

## Exercício

1. Mostre, na lei da probabilidade total, que basta que $\mathbb{P}(B_1 \cup \cdots \cup B_k) = 1$ e $\mathbb{P}(B_i \cap B_j) = 0,$ para $i, j = 1, \ldots, k,$ com $i \neq j.$

1. Em um torneio de xadrez, podemos classificar os jogadores em níveis A, B e C. Além de você, há 3 jogadores de nível A, 4 de nível B e 8 de nível C. O seu primeiro oponente é sorteado aleatoriamente dentre esses. As suas chances de vitória são $\mathbb{P}(\textrm{vitória} | \textrm{oponente nível A}) = 0.5,$ $\mathbb{P}(\textrm{vitória} | \textrm{oponente nível B}) = 0.65$ e $\mathbb{P}(\textrm{vitória} | \textrm{oponente nível C}) = 0.8.$ Quais as suas chances de vitória no primeiro jogo?

1. No exemplo do teste clínico, suponha, no entanto, que a doença atinge apenas 0,1% da população, mantendo a eficácia do teste em 96% e a taxa de falsos positivos em 0,1%. Encontre as chances de uma pessoa qualquer ser testada positivo e as chances de uma pessoa testada positivo realmente ter a doença. Repita as contas no caso em que a doença atinge 1% e a taxa de falsos positivos sobe para 1%.