@def title = "Tipos de convergências"

# {{ get_title }}

> "Whereas weak convergence measures the *error of the means*, strong convergence measures the *mean of the errors*". - Higham & Kloeden, in *An Introduction to the Numerical Simulation of Stochastic Differential Equations* (SIAM, 2021) página 83, Seção 8.4.

## Noções de convergência para sequências de variáveis aleatórias reais

Vamos considerar, para começar, variáveis aleatórias reais $X$ e $\{X_n\}_{n\in \mathbb{N}}$ em um mesmo espaço de probabilidade $(\Omega, \mathcal{A}, \mathbb{P})$.

### Convergência forte ou quase certamente

Dizemos que $X_n$ **converge fortemente**, ou **quase sempre**, ou **quase certamente**, ou **em quase toda parte**, para $X$ quando o conjunto $\{\omega; \;X_n(\omega) \rightarrow X(\omega)\}$ tem probabilidade total, i.e.
$$
\mathbb{P}(X_n \rightarrow X) = 1.
$$

### Convergência em probabilidade

Dizemos que $X_n$ **converge em probabilidade**, ou **em medida**, para $X$ quando
$$
\forall \varepsilon > 0, \; \mathbb{P}(|X_n - X| > \varepsilon) \rightarrow 0.
$$

### Convergência fraca ou em distribuição

Dizemos que $X_n$ **converge fracamente**, ou **em distribuição**, para $X$ quando
$$
\mathbb{P}(X_n \leq x) \rightarrow \mathbb{P}(X \leq x),
$$
para todo $x$ que seja ponto de continuidade da função $x \mapsto \mathbb{P}(X \leq x)$ de distribuição acumulada de $X$.

### Convergência em média

Dizemos que $X_n$ **converge em média** para $X$ quando
$$
\mathbb{E}(|X_n - X|) \rightarrow 0.
$$

### Convergência em momento $p$

Dizemos que $X_n$ **converge em momento de ordem $r > 0$** para $X$ quando
$$
\mathbb{E}(|X_n - X|^r) \rightarrow 0.
$$

### Relações entre as convergências

#### Convergência forte implica em convergência em probabilidade

#### Convergência em probabilidade implica em subsequência convergindo fortemente

Seja $n_1$ tal que
$$
\mathbb{P}\left(|X_n - X| > \frac{1}{2}\right) \leq \frac{1}{2}, \qquad \forall n \geq n_1
$$
e defina, recursivamente, $n_k > n_{k-1}$ tal que
$$
\mathbb{P}\left(|X_n - X| > \frac{1}{2^k}\right) \leq \frac{1}{2^k}, \qquad \forall n \geq n_k.
$$

Temos
$$
\sum_k \mathbb{P}\left(|X_{n_k} - X| > \frac{1}{2^k}\right) < \infty.
$$

Pelo Lema de Borel-Cantelli,
$$
\mathbb{P}\left(\limsup_{k\rightarrow \infty} \left\{|X_{n_k} - X| > \frac{1}{2^k}\right\}\right) = 0.
$$

Seja
$$
N = \limsup_{k\rightarrow \infty} \left\{|X_{n_k} - X| > \frac{1}{2^k}\right\} = \left\{\omega; \forall j, \;\exists k \geq j, \; |X_{n_k} - X| > \frac{1}{2^k} \right\}
$$

Se $\omega\notin N$, então existe $j$ tal que
$$
|X_{n_k} - X| \geq \frac{1}{2^k}, \qquad \forall k \geq j.
$$
Ou seja,
$$
X_{n_k} \rightarrow X, \qquad k \rightarrow \infty.
$$

Em outras palavras, como $N$ tem probabilidade nula, temos convergência forte da subsequência:
$$
\mathbb{P}\left( X_{n_k} \rightarrow X \right) = 1.
$$

#### Convergência em probabilidade de sequência monótona implica em convergência forte

Vimos acima que convergência em probabilidade implica na convergência quase certamente de uma subsequência $X_{n_k} \rightarrow X$. Ou seja, para quase todo $\omega$, dado $\varepsilon > 0$, existe $j$ tal que
$$
X - \varepsilon < X_{n_k} < X + \varepsilon, \qquad \forall k \geq j.
$$

Como a sequência é monótona, digamos monótona não-decrescente (é análogo caso seja não-crescente), então, para todo $n \geq n_j$, temos $n_k \leq n < n_{k+1}$, para algum $k \geq j$. Assim,
$$
X - \varepsilon < X_{n_k} \leq X_n \leq X_{n_{k+1}} < X + \varepsilon.
$$

Em outras palavras, para todo $\varepsilon > 0$, existe $j$ tal que
$$
X - \varepsilon < X_n < X + \varepsilon.
$$

Isso significa que, quase certamente, $X_n \rightarrow X$, concluindo a demonstração.
