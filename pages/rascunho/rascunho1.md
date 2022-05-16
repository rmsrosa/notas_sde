@def title = "Rascunho 1"

# {{ get_title }}

## Existência de sequências de variáveis aleatórias i.i.d.

Considere uma distribuição de probabilidades $\mu$ em $\mathbb{R}$. Podemos construir uma sequência $X_1, X_2, \ldots$ de variáveis aleatórias i.i.d., cada uma com distribuição $\mu$, da seguinte forma.

Tomamos $\Omega = \mathbb{R}^\mathbb{N} = \{x:\mathbb{N} \rightarrow \mathbb{R}\} = \{x = (x_1, x_2, \ldots); \; x_n\in \mathbb{R}, \forall n\in \mathbb{N}\}$.

Em $\Omega$, consideramos a topologia produto, i.e. dada a partir de uma base de abertos composta pelos *cilindros* $O_1 \times \cdots \times O_n \times \mathbb{R} \times \cdots$, onde $n\in \mathbb{N}$ e $O_j$ são abertos. Esta é a menor topologia que faz das projeções $\pi_n :\Omega \rightarrow \mathbb{R}$, definidas por $\pi_n x = x_n$, serem funções contínuas.

Fazemos $\mathcal{A}$ como a $\sigma$-algebra gerada por esses cilindros. Dessa forma, as projeções $\pi_n$ são funções mensuráveis. Em particular, podemos tratar das variáveis aleatórias $X_n = \pi_n X$ da variável multivariada $X\in \Omega$ (que ainda não definimos).

Agora, vamos definir uma função $\mathcal{P}$ no subconjunto de cilindros, em $\Omega$, da forma $E_1 \times E_2 \times \cdots$, onde $E_i = (a_i, b_i)$, para $i = i_1, \ldots, i_n$, $-\infty \leq a_i \leq b_i \leq \infty$, e $E_i = \mathbb{R}$, para $i \neq i_1, \ldots, i_n$. Primeiro, definimos,
$$
\mathcal{P}(a < X_n < b) = \mu(a < r < b) = \mu((a, b)).
$$
Agora, definimos (para que as variáveis aleatórias sejam independentes):
$$
\mathcal{P}(a_1 < X_{i_1} < b_1, \ldots, a_n < X_{i_n} < b_n) = \mathbb{P}(a_1 < X_{i_1} < b_1) \cdots \mathbb{P}(a_n < X_{i_1} < b_n) = \mu((a_1, b_1)) \cdots \mu((a_n, b_n)).
$$
Esse subconjunto $\mathcal{C}$ de cilindros dessa forma é um semi-anel (i.e. $\emptyset \in \mathcal{C}$; $A \cup B \in \mathcal{C}$ para $A, B\in \mathcal{C}$; e $A \setminus B = C_1 \cup \ldots \cup C_n$, para alguma combinação de cilindros disjuntos $C_i \in \mathcal{C}$, $i = 1, \ldots, n$.). Uniões finitas de conjuntos em $\mathcal{C}$, por sua vez, formam uma álgebra.

Já a função $\mathbb{P}$ é tal que $\mathbb{P}(\emptyset) = 0$ e é aditiva em relação a uniões disjuntas, i.e. $\mathbb{P}(\cup_{i = 1}^n C_i) = \sum_{i=1}^n \mathbb{P}(C_i)$, para quaisquer cilindros disjuntos $C_1, \ldots, C_n\in \mathcal{C}$.

A partir disso, é possível estender $\mathbb{P}$ a uma pré-medida na álgebra gerada pela união finita de cilindros. Em seguida, usando o Teorema de extensão de Carathéodory, podemos estender $\mathbb{P}$ a uma medida exterior na $\sigma$-álgebra gerada por $\mathcal{C}$, que é, exatamente, $\mathcal{A}$. Falta chegarmos a uma medida...
