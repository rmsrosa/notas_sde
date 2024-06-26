@def title = "Tipos de convergências"

# {{ get_title }}

> "Whereas weak convergence measures the *error of the means*, strong convergence measures the *mean of the errors*". - Higham & Kloeden, in *An Introduction to the Numerical Simulation of Stochastic Differential Equations* (SIAM, 2021) página 83, Seção 8.4.

## Noções de convergência para sequências de variáveis aleatórias reais

Vamos considerar, para começar, variáveis aleatórias reais $X$ e $\{X_n\}_{n\in \mathbb{N}}$ em um mesmo espaço de probabilidade $(\Omega, \mathcal{A}, \mathbb{P}).$

### Convergência quase certamente

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
para todo $x$ que seja ponto de continuidade da função $x \mapsto \mathbb{P}(X \leq x)$ de distribuição acumulada de $X.$

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

Dado $p > 0,$ dizemos que $X_n$ **converge em média p**, ou **converge em momento de ordem p** para $X$ quando
$$
\mathbb{E}(|X_n - X|^p) \rightarrow 0.
$$

A convergência em média corresponde ao caso $p = 1$ e a convergência em média quadrática corresponde a $p = 2.$ Em Teoria da Medida, dizemos que $X_n$ converge para $X$ em $L^p(\Omega).$

Para todo $p \geq 1,$ $L^p(\Omega)$ forma uma *espaço de Banach*, que é um espaço normado completo, com norma $\|X\|_{L^p} = \left(\mathbb{E}[|X|^p]\right)^{1/p}.$ No caso $p = 2,$ temos que $L^2(\Omega)$ é um *espaço de Hilbert*, que é um espaço normado completo onde a norma está associada a um produto interno. No caso, o produto interno entre duas variáveis aleatórias $X$ e $Y$ é $\langle X, Y \rangle = \mathbb{E}[XY].$ A norma $L^2(\Omega)$ é $\|X\|_{L^2} = \sqrt{\mathbb{E}[X^2]}.$

### Relações entre as convergências

#### Convergência quase certamente implica em convergência em probabilidade

Considere $\{X_n\}_n$ convergindo quase certamente para $X.$ Então $\mathbb{P}(X_n \rightarrow X) = 1.$ De outra forma, temos que
$$
\mathbb{P}(\lim_{n\rightarrow \infty} X_n \neq X) = 0.
$$

Podemos escrever
$$
\left\{\lim_{n\rightarrow \infty} X_n \neq X\right\} = \left\{\lim_{n\rightarrow \infty} \|X_n - X\| > 0\right\} = \bigcup_{k\in \mathbb{N}}\left\{\lim_{n\rightarrow \infty} \|X_n - X\| \geq \varepsilon_k\right\},
$$
para uma sequência qualquer $\{\varepsilon_k\}_{k\in\mathbb{N}}$ de números positivos com $\varepsilon_k \rightarrow 0.$ Isso implica em
$$
\mathbb{P}\left(\lim_{n\rightarrow \infty} \|X_n - X\| \geq \varepsilon_k\right) = 0, \quad \forall k\in\mathbb{N}.
$$
Como $\varepsilon_k \rightarrow 0,$ então
$$
\mathbb{P}\left(\lim_{n\rightarrow \infty} \|X_n - X\| \geq \varepsilon\right) = 0, \quad \forall \varepsilon > 0,
$$
o que significa dizer que $X_n \rightarrow X$ em probabilidade.

#### Convergência em média $p > 1$ implica em convergência em média $1 \leq q < p$

Supondo $X_n \rightarrow X$ em média $p > 1,$ quando $n\rightarrow \infty,$ e considerando $1 \leq q < p,$ temos
$$
    \mathbb{E}[|X_n - X|^q] \leq \mathbb{E}[|X_n - X|^p]^{q/p} \rightarrow 0,
$$
quando $n\rightarrow \infty,$ mostrando a convergência em média $q.$

#### Convergência em média $p \geq 1$ implica em convergência em probabilidade

Suponha que $X_n \rightarrow X$ em média $p,$ com $p \geq 1,$ o que significa que
$$
    \mathbb{E}[|X_n - X|^p] \rightarrow 0,
$$
quando $n\rightarrow \infty.$ Dado $\varepsilon > 0,$ temos, então,
$$
    \mathbb{P}(|X_n - X| > \varepsilon) \leq \frac{\mathbb{E}[|X_n - X|]}{\varepsilon} \leq \frac{\mathbb{E}[|X_n - X|^p]^{1/p}}{\varepsilon} \rightarrow 0,
$$
quando $n\rightarrow \infty,$ o que significa dizer que $X_n \rightarrow X$ em probabilidade.

#### Convergência em probabilidade com erro somável implica em subsequência convergindo quase certamente

Suponha que, para todo $\varepsilon > 0,$ vale
$$
\sum_{n=1}^\infty \mathbb{P}(|X_n - X| > \varepsilon) < \infty.
$$

Então, pelo Lema de Borel-Cantelli,
$$
\mathbb{P}(\limsup_{n\rightarrow\infty} |X_n - X| > \varepsilon) = 0.
$$

Observe que não há ambiguidade acima, pois
$$
\begin{align*}
\limsup_{n\rightarrow\infty} \{|X_n - X| > \varepsilon\} & = 
\bigcap_n \bigcup_k \{|X_k - X| > \varepsilon\} \\
& = \left\{\forall n, \exists k\geq n |X_k - X| > \varepsilon \right\} \\
& = \left\{\;\limsup_{n\rightarrow \infty}|X_k - X| > \varepsilon\right\}.
\end{align*}
$$

Tomando uma sequência positiva $\varepsilon_n \rightarrow 0,$ temos
$$
\mathbb{P}\left(\limsup_{n\rightarrow\infty} |X_n - X| > 0\right) = \mathbb{P}\left(\bigcup_n \left(\limsup_{n\rightarrow\infty} |X_n - X| > \varepsilon_n\right)\right) = 0.
$$
Logo,
$$
\mathbb{P}\left(\lim_{n\rightarrow \infty} X_n = X\right) = 1,
$$
provando a convergência $X_n \rightarrow X$ quase certamente.

#### Convergência em probabilidade implica em subsequência convergindo quase certamente

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

Assim, para qualquer $\varepsilon > 0,$ temos
$$
\sum_k \mathbb{P}\left(|X_{n_k} - X| > \varepsilon\right) < \infty.
$$

Pelo resultado anterior de convergência com erros somáveis, obtemos a convergência quase certamente da subsequência:
$$
\mathbb{P}\left( X_{n_k} \rightarrow X \right) = 1.
$$

#### Convergência em probabilidade de sequência monótona implica em convergência quase certamente

Vimos acima que convergência em probabilidade implica na convergência quase certamente de uma subsequência $X_{n_k} \rightarrow X.$ Ou seja, para quase todo $\omega,$ dado $\varepsilon > 0,$ existe $j$ tal que
$$
X - \varepsilon < X_{n_k} < X + \varepsilon, \qquad \forall k \geq j.
$$

Como a sequência é monótona, digamos monótona não decrescente (é análogo caso seja não crescente), então, para todo $n \geq n_j,$ temos $n_k \leq n < n_{k+1},$ para algum $k \geq j.$ Assim,
$$
X - \varepsilon < X_{n_k} \leq X_n \leq X_{n_{k+1}} < X + \varepsilon.
$$

Em outras palavras, para todo $\varepsilon > 0,$ existe $j$ tal que
$$
X - \varepsilon < X_n < X + \varepsilon.
$$

Isso significa que, quase certamente, $X_n \rightarrow X,$ concluindo a demonstração.

#### Esperança convergindo e variância esvanecendo implica em convergência em probabilidade para constante

Suponha que $\{X_n\}_{n\in\mathbb{N}}$ seja um processo discreto real tal que
$$
    \mathbb{E}[X_n] \rightarrow c, \quad \mathrm{Var}(X_n) = 0.
$$

Então
$$
    \mathbb{P}\left(|X_n - c| > \varepsilon\right) = \int_{|X_n - c| > \varepsilon} \;\mathrm{d}F_{X_n}(x),
$$
onde $F_{X_n}(x) = \mathbb{P}(X_n < x)$ é a função de probabilidade acumulada de $X_n.$

Como $1 \leq (X_n - c)^2 / \varepsilon^2$ no domínio de integração,
$$
\begin{align*}
    \mathbb{P}\left(|X_n - c| > \varepsilon\right) & \leq \frac{1}{\varepsilon^2}\int_{\mathbb{R}} (X_n - c)^2 \;\mathbb{d}F_{X_n}(x) \\
    & \leq \frac{1}{\varepsilon^2}\int_{\mathbb{R}} (X_n - E[X_n])^2 \;\mathrm{d}F_{X_n}(x) + \frac{1}{\varepsilon^2}\int_{\mathbb{R}} (E[X_n] - c)^2 \;\mathrm{d}F_{X_n}(x) \\
    & = \frac{1}{\varepsilon^2}\mathrm{Var}(X_n) + \frac{1}{\varepsilon^2}(E[X_n] - c)^2 \rightarrow 0, \quad n\rightarrow \infty,
\end{align*}
$$
provando a convergência em probabilidade para uma constante.

## Exemplos

### Sequências de normais dependentes

Considere uma variável aleatória normal $X \sim \mathcal{N}(0, 1)$ e defina a sequência
$$
X_n = \frac{1}{n}X.
$$
Observe que $X_n \sim \mathcal{N}(0, 1/n^2).$ Vamos mostrar que essa sequência converge para zero, cuja distribuição é a delta de Dirac $0 \sim \mathrm{Dirac}(0) = \mathcal{N}(0, 0),$ em vários sentidos.

Os caminhos amostrais são
$$
t\mapsto X_n(\omega) = \frac{\omega}{n}.
$$
Observe que essas variáveis não são independentes. Para cada $\omega,$ temos
$$
X_n(\omega) = \frac{\omega}{n} \rightarrow 0, \qquad n \rightarrow 0.
$$
Ou seja, $X_n$ converge para $0$ quase certamente. Isso implica nas outras convergências. Mas podemos prová-las diretamente. De fato, para qualquer $\varepsilon > 0,$
$$
\mathbb{P}(|X_n| > \varepsilon) = \mathbb{P}(|X| > n\varepsilon ) \rightarrow 0, \qquad n \rightarrow 0,
$$
mostrando a convergência em probabilidade. Agora, observe que a função de distribuição acumulada da variável limite (igual a zero quase sempre) é
$$
F(x) = \begin{cases} 0, & x < 0, \\
1, & x \geq 0.
\end{cases}
$$
Os pontos de continuidade de $F$ são os pontos $x \neq 0.$ Nesses pontos, temos,
$$
\mathbb{P}(X_n \leq x) = \mathbb{P}(X \leq n x) \rightarrow \begin{cases} 0, & x < 0, \\
1, & x > 0.
\end{cases}
$$
No ponto de descontinuidade $x = 0,$ temos
$$
\mathbb{P}(X_n \leq 0) = \frac{1}{2},
$$
mas isso não atrapalha a convergência $X_n \rightarrow 0$ em distribuição.

A convergência em média quadrática pode ser obtida diretamente da variância de cada termo da sequência:
$$
\mathbb{P}(|X_n - 0|^2) = \mathrm{Var}(X_n) = \frac{1}{n^2} \rightarrow 0, \qquad n \rightarrow \infty.
$$

### Sequências de normais independentes

Podemos considerar sequências independentes definindo $\Omega = \mathbb{R}^\mathbb{N} = \{\omega = (\omega_1, \omega_2, \ldots); \;\omega_n\in \mathbb{R}\}$ e definindo $\mathbb{P}$ por
$$
\mathbb{P}(X_{n_1} \leq x_1, \ldots, X_{n_k} \leq x_k) = \mathbb{P}(X_{n_1}\leq x_1)\times \cdots \times \mathbb{P}(X_{n_k}\leq x_k),
$$
onde a distribuição de cada $X_n$ é uma Gaussiana
$$
\frac{1}{\sqrt{2\pi \sigma_n^2}}e^{-x^2/2\sigma_n^2},
$$
onde $\sigma_n > 0.$

### Convergências quase certamente e em probabilidade não implicam em convergência em média

Seja $\Omega = [0, 1]$ com medida de probabilidade $\mathbb{P}$ uniforme em $\Omega.$ Considere a sequência $X_n$ definida por
$$
    X_n(\omega) = n^2\chi_{[0, 1/n]}(\omega), \qquad n \in \mathbb{N},
$$
em $\Omega = [0, 1],$ onde $\chi_{[0, 1/n]}(\omega),$ $\omega\in\Omega$ é a função característica do intervalo $[0, 1/n].$ Então
$$
    X_n(\omega) \rightarrow 0,
$$
para todo $\omega \in (0, 1],$ portanto $X_n \rightarrow X=0,$ quase certamente. Com isso, também temos a convergência em probabilidade, o que pode também ser obtido explicitamente, visto que para $0 < \varepsilon \leq 1,$ temos
$$
    \mathbb{P}(|X_n - X| \geq \varepsilon) = \mathbb{P}(X_n \geq \varepsilon) = \frac{1}{n} \rightarrow 0,
$$
de modo que $X_n \rightarrow 0$ também em probabilidade. No entanto,
$$
    \mathbb{E}[|X_n - X|] = \mathbb{E}[X_n] = \frac{n^2}{n} = n \rightarrow \infty,
$$
de modo que $X_n$ não converge para $X=0$ em média, nem em qualquer média $p > 1.$

### Convergência em probabilidade não implica em convergência quase certamente

Novamente considere $\Omega = [0, 1]$ com medida de probabilidade $\mathbb{P}$ uniforme em $\Omega.$ Para cada $n\in\mathbb{N},$ escrevemos $k = \log_2(n)$ e $j = n - 2^k,$ de modo que $n = 2^k + j,$ com $k\in \mathbb{N}$ e $0 \leq j \leq 2^k-1.$ Com essa decomposição (única), definimos a sequência
$$
    X_n = \chi_{\left[\frac{j}{2^k}, \frac{j+1}{2^k}\right]}.
$$
Para essa sequência, temos $X_n(\omega)$ assumindo os valores $0$ e $1$ indefinidamente, para todo $\omega\in\Omega,$ de modo que $X_n$ não converge para $X=0$ em nenhum ponto. Por outro lado, para qualquer $0 < \varepsilon < 1,$ temos
$$
    \mathbb{P}(|X_n - X| > \varepsilon) = \mathbb{P}(X_n > \varepsilon) = \frac{1}{2^k} \rightarrow 0, \qquad n\rightarrow \infty.
$$
Portanto, $X_n \rightarrow X = 0$ em probabilidade mas não converge em nenhum ponto.
