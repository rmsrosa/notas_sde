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

### Convergência em média quadrática

Dizemos que $X_n$ **converge em média quadrática** para $X$ quando
$$
\mathbb{E}(|X_n - X|^2) \rightarrow 0.
$$

### Convergência em média $p$

Dado $p > 0$, dizemos que $X_n$ **converge em média p**, ou **converge em momento de ordem p** para $X$ quando
$$
\mathbb{E}(|X_n - X|^p) \rightarrow 0.
$$

A convergência em média corresponde ao caso $p = 1$ e a convergência em média quadrática corresponde a $p = 2$. Em Teoria da Medida, dizemos que $X_n$ converge para $X$ em $L^p(\Omega)$.

Para todo $p \geq 1$, $L^p(\Omega)$ forma uma *espaço de Banach*, que é um espaço normado completo, com norma $\|X\|_{L^p} = \left(\mathbb{E}[|X|^p]\right)^{1/p}$. No caso $p = 2$, temos que $L^2(\Omega)$ é um *espaço de Hilbert*, que é um espaço normado completo onde a norma está associada a um produto interno. No caso, o produto interno entre duas variáveis aleatórias $X$ e $Y$ é $\langle X, Y \rangle = \mathbb{E}[XY]$. A norma $L^2(\Omega)$ é $\|X\|_{L^2} = \sqrt{\mathbb{E}[X^2]}$.

### Relações entre as convergências

#### Convergência forte implica em convergência em probabilidade

#### Convergência em probabilidade com erro somável implica em subsequência convergindo fortemente

Suponha que, para todo $\varepsilon > 0$, vale
$$
\sum_{n=1}^\infty \mathbb{P}(|X_n - X| > \varepsilon) < \infty.
$$

Então, pelo Lema de Borel-Cantelli,
$$
\mathbb{P}(\limsup_{n\rightarrow\infty} |X_n - X| > \varepsilon) = 0.
$$

Observe que não há ambiguidade acima, pois
$$
\limsup_{n\rightarrow\infty} \{|X_n - X| > \varepsilon\} = 
\bigcap_n \bigcup_k \{\omega; |X_k - X| > \varepsilon\} = \left\{\omega; \forall n, \exists k\geq n |X_k - X| > \varepsilon \right\} = \left\{\omega; \;\limsup_{n\rightarrow \infty}|X_k - X| > \varepsilon\right\}.
$$

Tomando uma sequência positiva $\varepsilon_n \rightarrow 0$, temos
$$
\mathbb{P}\left(\limsup_{n\rightarrow\infty} |X_n - X| > 0\right) = \mathbb{P}\left(\bigcup_n \left(\limsup_{n\rightarrow\infty} |X_n - X| > \varepsilon_n\right)\right) = 0.
$$
Logo,
$$
\mathbb{P}\left(\lim_{n\rightarrow \infty} X_n = X\right) = 1,
$$
provando a convergência $X_n \rightarrow X$ quase certamente.

#### Convergência em probabilidade implica em subsequência convergindo fortemente

Seja $n_1$ tal que
$$
\mathbb{P}\left(|X_n - X| > \frac{1}{2}\right) \leq \frac{1}{2}, \qquad \forall n \geq n_1
$$
e defina, recursivamente, $n_k > n_{k-1}$ tal que
$$
\mathbb{P}\left(|X_n - X| > \frac{1}{k}\right) \leq \frac{1}{2^k}, \qquad \forall n \geq n_k.
$$

Temos
$$
\sum_k \mathbb{P}\left(|X_{n_k} - X| > \frac{1}{k}\right) < \infty.
$$

Assim, para qualquer $\varepsilon > 0$, temos
$$
\sum_k \mathbb{P}\left(|X_{n_k} - X| > \varepsilon\right) < \infty.
$$

Pelo resultado anterior de convergência com erros somáveis, obtemos a convergência forte da subsequência:
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
