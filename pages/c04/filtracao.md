@def title = "Filtração"

# {{ get_title }}

O conceito de *filtração* é fundamental para a definição e análise de processos do tipo Martingale e no cálculo estocástico com integrais de Itô, por exemplo. Intuitivamente, uma filtração carrega a informação de algum processo até um determinado instante. Vamos começar com um exemplo, para ilustrar a ideia.

## Filtração em um passeio aleatório

Considere o passeio aleatório $\{X_n\}_{n=0}^\infty,$ onde $X_0 = 0.$ Digamos que queiramos calcular a esperança de $X_2,$ dado $X_1$:
$$
\mathbb{E}\left[X_2 | X_1 = x_1\right].
$$
As únicas possibilidades para $X_1$ são $X_1 = -1$ e $X_1 = 1.$ Caso $X_1 = 1,$ então podemos ter $X_2$ igual a $2$ ou $0,$ com probabilidade $1/2$ cada um. Ou seja,
$$
\mathbb{E}\left[X_2 | X_1 = 1\right] = 2 \times \frac{1}{2} + 0 \times \frac{1}{2} = 1.
$$
Caso $X_1 = -1,$ temos
$$
\mathbb{E}\left[X_2 | X_1 = -1\right] = 0 \times \frac{1}{2} - 2 \times \frac{1}{2} = -1.
$$
De qualquer forma, temos
$$
\mathbb{E}\left[X_2 | X_1\right] = X_1.
$$
Lembremos que as probabilidades condicionadas se traduzem na forma de probabilidades de conjuntos:
$$
\begin{align*}
\mathbb{P}(X_2 \in E | X_1 \in E_1) & = \mathbb{P}(\{\omega; \;X_2(\omega) \in E\} | \{\omega; X_1(\omega) \in E_1\}) \\
& = \mathbb{P}(X_2^{-1}(E) | X_1^{-1}(E_1)).
\end{align*}
$$
De outra forma,
$$
\mathbb{P}(X_2 \in E | X_1 \in E_1) = \mathbb{P}(X_2 \in E | A_1) = \mathbb{P}_{A_1}(X_2 \in E),
$$
onde $A_1 = X_1^{-1}(E_1).$

Caso tenhamos eventos $X_0 \in E_0, X_1\in E_1, \ldots, X_n \in E_n,$ podemos considerar o valor esperado para $X_{n+1}$:
$$
\mathbb{E}\left[X_{n+1} | X_0 \in E_0, X_1\in E_1, \ldots, X_n \in E_n\right].
$$
Este é calculado em termos da probabilidade condicionada
$$
\mathbb{P}_{A_n}(E) = \mathbb{P}\left(X_{n+1}\in E | X_0 \in E_0, X_1\in E_1, \ldots, X_n \in E_n\right) = \mathbb{P}\left(X_{n+1}\in E | A_n\right),
$$
onde
$$
A_n = \{\omega; X_0(\omega) \in E_0, X_1(\omega) \in E_1, \ldots, X_n(\omega) \in E_n\} = X_0^{-1}(E_0) \cap X_1^{-1}(E_1) \cap \ldots \cap X_n^{-1}(E_n).
$$

Na verdade, não há motivo para nos restringirmos a conjuntos cilíndricos dessa forma. Podemos considerar informações sobre os estados passados que formem conjuntos que sejam uniões e/ou interseções de diferentes conjuntos cilíndricos da forma acima. Isso nos leva, naturalmente, a considerarmos conjuntos $A_n$ que pertençam à $\sigma$-álgebra gerada por esses conjuntos cilíndricos. Denotamos essa tal $\sigma$-álgebra por $\mathcal{F}_n.$ Ou seja, $\mathcal{F}_n$ é a $\sigma$-álgebra gerada pelo conjunto de cilindros da forma $X_0^{-1}(E_0) \cap X_1^{-1}(E_1) \cap \ldots \cap X_n^{-1}(E_n),$ onde $E_0, E_1, \ldots, E_n\in \mathcal{E}.$ Escrevemos isso como
$$
\mathcal{F}_n = \sigma\left(\left\{ X_0^{-1}(E_0) \cap X_1^{-1}(E_1) \cap \ldots \cap X_n^{-1}(E_n); \;E_1, \ldots, E_n\in \mathcal{E}\right\}\right).
$$

Observe que, por construção,
$$
\mathcal{F}_1 \subset \mathcal{F}_2 \subset \ldots \subset \mathcal{A}.
$$

Assim, podemos considerar as probabilidades condicionadas
$$
\mathbb{P}_{A_n}(X_{n+1} \in E),
$$
para um $A_n \in \mathcal{F}_n$ arbitrário.

Essa sequência $\mathcal{F}_n$ de $\sigma$-álgebras in $\mathcal{A}$ é um exemplo de *filtração* denominado de **filtração natural** do processo $\{X_n\}_n$ do passeio aleatório.

Para tornar o exemplo mais concreto, podemos considerar 
1. $\Omega = \mathbb{Z}^{\mathbb{Z}^*} = \{\omega = (\omega_0, \omega_1, \ldots); \; \omega_n \in \mathbb{Z}, n = 0, 1, \ldots\}$;
2. $\mathcal{A} = \mathcal{P}(\Omega)$ como sendo o conjunto de todas as partes de $\Omega$; e 
3. $X_n(\omega) = \omega_n,$ para $\omega = (\omega_0, \omega_1, \omega_2, \ldots) \in \Omega.$

Assim, a filtração é dada por $\mathcal{F}_n$ definido como a $\sigma$-álgebra gerada pelos conjuntos cilíndricos da forma
$$
E_0 \times E_1 \times \ldots \times E_n \times \mathbb{Z} \times \mathbb{Z} \times \cdots,
$$
onde $E_0, E_1, \ldots, E_n \subset \mathbb{Z}.$ Dessa forma, não temos como observar eventos a partir de $X_{n+1}$ olhando para a filtração até $\mathcal{F}_n.$


## Filtração

Vamos, agora, à definição formal. Uma **filtração** em um espaço mensurável $(\Omega, \mathcal{A})$ é uma família não decrescente $\{\mathcal{F}_t\}_{t\in I},$ em algum espaço de índices $I$ discreto ou contínuo, de $\sigma$-álgebras contidas em $\mathcal{A},$ i.e.

1. $\mathcal{F}_t$ é uma $\sigma$-álgebra em $\Omega,$ para todo $t\in I$;
2. $\mathcal{F}_t$ é uma sub $\sigma$-álgebra de $\mathcal{A},$ i.e. $\mathcal{F}_t \subset \mathcal{A}$; e
3. É uma família não decrescente, i.e. $\mathcal{F}_s \subset \mathcal{F}_t,$ para todo $s, t\in I$ com $s < t.$

Denominamos um tal $(\Omega, \mathcal{A}, \{\mathcal{F}_t\}_{t\in I})$ por **espaço filtrado.**.

No caso discreto $I = \mathbb{N},$ basta pedir que $\mathcal{F}_1 \subset \mathcal{F}_2 \subset \ldots \subset \mathcal{F}_n \subset \mathcal{F}_{n+1} \subset \ldots \subset \mathcal{A},$ com cada $\mathcal{F}_n$ sendo uma $\sigma$-álgebra.

## Processo adaptado

Um processo $\{X_t\}_{t\in I}$ em $(\Omega, \mathcal{A}, \mathbb{P})$ é dito **adaptado** a uma filtração $\{\mathcal{F}_t\}_{t\in I}$ nesse espaço de probabilidades quando $X_t$ é $\mathcal{F}_t$-mensurável, para qualquer $t \in I.$ Um tal processo também é dito **não antecipativo,** em relação a essa filtração. De fato, qualquer evento $E$ observável por $X_t$ deve estar associado a um conjunto amostral $X_t^{-1}(E)$ em $\mathcal{F}_t,$ sem necessitar de conjuntos nas $\sigma$-álgebras posteriores.

Por exemplo, o passeio aleatório considerado acima está adaptado à filtração natural definida por ele. De fato, qualquer processo é adaptado à sua filtração natural, por construção.

Esse conceito é útil na definição formal de Martingale, onde exigimos, para ser uma Martingale, um determinado processo $\{X_t\}_t$ seja tal que 
$$
\mathbb{E}[|X_t|] < \infty \quad \textrm{e} \quad \mathbb{E}[X_{t + \tau} | A_t] = X_t, \; \forall A_t \in \mathcal{F}_t, \;\forall t < t + \tau \text{ em } I.
$$

No desenvolvimento da integral de Itô, veremos uma outra situação, em que exigiremos que um determinando processo $\{H_t\}_t$ seja adaptado à filtração natural de outro processo, como um processo de Wiener $\{W_t\}_t.$ Dessa forma, teremos boas propriedades da integral de Itô $\int_a^b H_t \;\mathrm{d}W_t$ de $\{H_t\}_t$ em relação a $\{W_t\}_t.$

## Filtração natural

Conforme feito no exemplo inicial, dado um processo discreto $\{X_n\}_{n\in \mathbb{N}}$ em um espaço de probabilidades $(\Omega, \mathcal{A}, \mathbb{P}),$ com valores em um espaço mensurável $(\Sigma, \mathcal{E}),$ definimos a **filtração natural** desse processo como sendo a filtração em que cada $\mathcal{F}_n$ é dado pela $\sigma$-álgebra gerada pelas variáveis aleatórias $X_1, \ldots, X_n,$ ou seja, a menor $\sigma$-álgebra em que $X_1, \ldots, X_n$ são mensuráveis (mas que $X_{n+1}, \ldots$ não precisam ser).

Uma tal $\sigma$ álgebra precisa conter todos os conjuntos da forma $X_j^{-1}(E_j),$ onde $j = 1, \ldots, n$ e $E_j\in \mathcal{E}.$

Para $n=1,$ essa $\sigma$-álgebra é exatamente a pré-imagem, por $X_1,$ de $\Sigma$ (a pré-imagem de uma $\sigma$-álgebra por uma função qualquer é necessariamente uma $\sigma$-álgebra, já que a operação inversa de função preserva todas as operações de conjuntos):
$$
\mathcal{F}_1 = \sigma(X_1) = X_1^{-1}(\mathcal{E}) = \{X_1^{-1}(E); \;\forall E\in \mathcal{E}\}.
$$

No caso geral $n,$ escrevemos
$$
\mathcal{F}_n = \sigma(X_1, \ldots, X_n) = \sigma( \{X_1^{-1}(E_1) \cap \ldots \cap X_n^{-1}(E_n); \; E_1, \ldots, E_n \in \Sigma\}).
$$

Por construção, um processo está sempre adaptado à sua filtração natural.
