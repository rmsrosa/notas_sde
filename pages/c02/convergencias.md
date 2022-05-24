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

#### Convergência em probabilidade de sequência monótona implica em convergência forte
