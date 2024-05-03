@def title = "Não diferenciabilidade quase sempre dos caminhos amostrais"

# {{ get_title }}

Caso os caminhos amostrais de um processo de Wiener $\{W_t\}_{t\geq 0}$ fossem diferenciáveis em um instante $t$, teríamos a existência, quase certamente, do limite
$$
\lim_{\tau \rightarrow 0} \frac{W_{t+\tau} - W_t}{\tau}.
$$
Em particular, teríamos
$$
\limsup_{\tau \rightarrow 0} \frac{|W_{t+\tau} - W_t|}{\tau} < \infty.
$$
quase certamente. Porém, isso não é verdade. Mais do que isso. Esse limite superior é infinito em todos os pontos, com probabilidade um. Ou seja, com probabilidade um, os caminhos amostrais não são diferenciáveis em instante algum.

Esse é um resultado importante, mas mais no sentido de fechar uma possível porta (de explorar a regularidade dos caminhos amostrais) do que de abrir outras. De qualquer forma, é um resultado fundamental. E as técnicas usadas podem, também, ser eventualmente úteis em outras questões.

A ideia fundamental vem do fato de que $W_{t+\tau} - W_t \sim \mathcal{N}(0, \tau),$ de forma que, tipicamente,
$$
    \frac{|W_{t+\tau} - W_t|}{\tau} \sim \frac{\sqrt{t}}{\tau} = \frac{1}{\sqrt{\tau}} \rightarrow \infty,
$$
quando $\tau \rightarrow 0.$ A questão é mostrar que isso ocorre quase certamente e em todos os instantes $t.$

## Não diferenciabilidade na origem

Vamos começar ilustrando isso no instante $t = 0$. Nesse caso, temos
$$
\lim_{\tau\rightarrow 0} \frac{W_\tau - W_0}{\tau} = \lim_{\tau\rightarrow 0} \frac{W_\tau}{\tau}.
$$
Vamos mostrar que
$$
\limsup_{\tau\rightarrow 0} \frac{|W_\tau|}{\tau} = \infty,
$$
quase certamente, ou seja,
$$
    \mathbb{P}\left(\limsup_{\tau\rightarrow 0} \frac{|W_\tau|}{\tau} = \infty\right) = 1.
$$

As sequências envolvidas no limite inferior acima podem variar com o caminho amostral. Mas podemos mostrar, na verdade, que esse limite superior é infinito mesmo fixando uma mesma sequência para os caminhos, desde que essa sequência decresça suficientemente rápido. Na verdade, podemos mostrar que, para essas sequências, até o limite inferior é infinito. Ou seja, vamos mostrar que existe uma sequência positiva $\tau_n \rightarrow 0$ tal que
$$
    \mathbb{P}\left(\liminf_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} = \infty\right) = 1.
$$
Observe que, de fato,
$$
    \left\{\liminf_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} = \infty\right\} \subset \left\{\limsup_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} = \infty\right\} \subset \left\{ \limsup_{\tau\rightarrow 0} \frac{|W_\tau|}{\tau} = \infty \right\}.
$$

Mostrar que o conjunto à esquerda tem probabilidade $1$ é equivalente a mostrar que
$$
    \mathbb{P}\left(\liminf_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} < \infty\right) = 0.
$$

Observe, ainda, que
$$
  \begin{align*}
    \left\{\liminf_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} < \infty\right\} & = \bigcup_{M\in\mathbb{N}} \left\{\liminf_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} \leq M\right\} \\
    & = \bigcup_{M\in\mathbb{N}} \left\{\forall k \in \mathbb{N}, \;\exists n \geq k, \; \frac{|W_{\tau_n}|}{\tau_n} \leq M\right\} \\
    & = \bigcup_{M\in\mathbb{N}} \bigcap_{k\in\mathbb{N}} \bigcup_{n\geq k} \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M\right\}.
  \end{align*}
$$

Como a união em $M\in\mathbb{N}$ é enumerável, basta mostrar, então, que, para cada $M > 0,$
$$
    \mathbb{P}\left(\bigcap_{k\in\mathbb{N}} \bigcup_{n\geq k} \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M\right\}\right) = 0.
$$
Observe, para tanto, que
$$
    \bigcap_{k\in\mathbb{N}} \bigcup_{n\geq k} \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M\right\} = \limsup_{n\rightarrow \infty} \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M\right\}.
$$
Usando o Lema de Borel-Cantelli para deduzir que o limite superior tem probabilidade nula, basta mostrar que
$$
    \sum_{n\in\mathbb{N}} \mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq M\right) < \infty.
$$
Para isso, vamos usar que
$$
    V_\tau = \frac{W_\tau}{\sqrt{\tau}} \sim \mathcal{N}(0, 1)
$$
e que, para uma tal normal padrão $V_\tau,$ vale
$$
    \mathbb{P}(|V_\tau| \leq r) = \int_{|x|\leq r} \frac{1}{\sqrt{2\pi}}e^{-x^2/2} \;\mathrm{d}x \leq \frac{1}{\sqrt{2\pi}} \int_{-r}^r \;\mathrm{d}x = \frac{1}{\sqrt{2\pi}} 2r = \sqrt{\frac{2}{\pi}} r,
$$
de modo que
$$
    \mathbb{P}\left( \frac{|W_{\tau_n}|}{\tau_n} \leq M \right) = \mathbb{P}\left( \frac{|W_{\tau_n}|}{\sqrt{\tau_n}} \leq \sqrt{\tau_n}M \right) \leq \sqrt{\frac{2}{\pi}} \sqrt{\tau_n} M.
$$
Assim,
$$
    \sum_{n\in\mathbb{N}} \mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq M\right) \leq \sqrt{\frac{2}{\pi}} M\sum_{n\in\mathbb{N}} \sqrt{\tau_n}.
$$
Basta, então, pegar qualquer sequência decrescendo suficientemente rápido para que o somatório seja finito, por exemplo,
$$
    \tau_n = \frac{1}{2^{2n}}.
$$
Com tal escolha,
$$
    \sum_{n\in\mathbb{N}} \mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq M\right) \leq \sqrt{\frac{2}{\pi}} M\sum_{n\in\mathbb{N}} \frac{1}{2^n} = \sqrt{\frac{2}{\pi}} M < \infty.
$$
Assim, segue do Lema de Borel-Cantelli que
$$
    \mathbb{P}\left(\bigcap_{k\in\mathbb{N}} \bigcup_{n\geq k} \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M\right\}\right) = \mathbb{P}\left( \limsup_{n\rightarrow \infty} \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M\right\} \right) = 0
$$
e, portanto, 
$$
    \begin{align*}
        \mathbb{P}\left(\limsup_{\tau\rightarrow 0} \frac{|W_\tau|}{\tau} = \infty\right) & \geq \mathbb{P}\left(\limsup_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} = \infty\right) \\
        & \geq \mathbb{P}\left(\liminf_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} = \infty\right) \\
        & = 1 - \mathbb{P}\left(\liminf_{n\rightarrow \infty} \frac{|W_{\tau_n}|}{\tau_n} < \infty\right) \\
        & = 1 - \sum_{M\in\mathbb{N}} \mathbb{P}\left( \limsup_{n\rightarrow \infty} \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M\right\} \right) \\
        & = 1 - 0 \\
        & = 1.
    \end{align*}
$$

Isso conclui a demonstração de que, quase certamente, os caminhos amostrais não são diferenciáveis em $t = 0$.

## Não diferenciabilidade em um conjunto enumerável de instantes

Como um processo de Wiener é invariante por translações, aplicando o resultado acima a $V_t^s = W_{s + t} - W_s$, para $s \geq 0$, segue que, para qualquer $t \geq 0$, quase todo caminho amostral é não diferenciável no instante $t$. Mas isso não é o mesmo que dizer que quase todo caminho amostral é não diferenciável em nenhum dos instantes $t \geq 0$. Isso também é verdade, mas não segue diretamente do resultado acima. Veremos isso a seguir. O que podemos obter do resultado acima é que quase todo caminho é não diferenciável em um conjunto denso enumerável de pontos, como os racionais. De fato, temos
$$
  \begin{align*}
    \mathbb{P}\left(\limsup_{\tau \rightarrow 0} \frac{|W_{t+\tau} - W_t|}{\tau} = \infty, \;\forall t\in \mathbb{Q}\cap [0, \infty)\right) & = 1 - \mathbb{P}\left(\exists t\in \mathbb{Q}\cap [0, \infty), \;\limsup_{\tau \rightarrow 0} \frac{|W_{t+\tau} - W_t|}{\tau} < \infty\right) \\
    & = 1 - \mathbb{P}\left( \bigcup_{t\in \mathbb{Q}\cap [0, \infty)} \limsup_{\tau \rightarrow 0} \frac{|W_{t+\tau} - W_t|}{\tau} < \infty \right) \\
    & = 1 - \sum_{t\in \mathbb{Q}\cap [0, \infty)} \mathbb{P}\left(\limsup_{\tau \rightarrow 0} \frac{|W_{t+\tau} - W_t}{\tau} = \infty\right) \\
    & = 1 - 0 \\
    & = 1.
  \end{align*}
$$

## Quase todo caminho amostral é não diferenciável em nenhum ponto

A demonstração de que quase todo caminho amostral não é diferenciável em nenhum ponto é mais delicada, como veremos agora. Vamos seguir essencialmente a demonstração em Mörters & Peres (2010), com algumas modificações.

Começamos mostrando a não diferenciabilidade no intervalo $[0, 1)$. Seja $t \mapsto W_t(\omega)$ um caminho amostral tal que, para algum $0\leq t_0 < 1$,
$$
\limsup_{\tau \rightarrow 0} \frac{|W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)|}{\tau} < \infty.
$$

Isso acontece se, e somente se, existem $m, M \in \mathbb{N}$ tais que
$$
\sup_{\tau\in (0,2^{-n+2}]} \frac{|W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)|}{\tau} \leq M, \qquad \forall n \geq m.
$$
O motivo de usarmos $2^{-n+2}$ acima, ao invés de $2^{-n}$, é que vamos usar, abaixo, a partição diádica de tal forma que quatro intervalos sucessivos da malha com espaçamento $2^{-n}$ cabem em um único intervalo da malha com espaçamento $2^{-n+2}$. A importância disso será vista em seguida.

```julia:dyadic_points
#hideall
using Plots
##theme(:ggplot2)
tt = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:2:3]
plot(title = "Malhas formadas por pontos diádicos", titlefont = 10, xaxis = "\$t\$", yaxis = false, xticks = (0.0:0.25:1.0, ""), xlims = (-0.05, 1.05), ylims = (-1, 1))
scatter!([j/4 for j in 0:4], [0], markersize = 4, label = false)
scatter!([0.0, 1.0], [0], markersize = 6, label = false)
annotate!([(0.0, -0.2, ("\$\\frac{(k-1)}{2^n}\$", 8)), (0.25, -0.2, ("\$\\frac{(k-1)}{2^n}\$", 8)), (0.5, -0.2, ("\$\\frac{k}{2^n}\$", 8)), (0.75, -0.2, ("\$\\frac{(k+1)}{2^n}\$", 8)), (1.0, -0.2, ("\$\\frac{(k+2)}{2^n}\$", 8))])
annotate!([(0.0, 0.25, ("\$\\frac{2^{-2}(k-1)}{2^{n-2}}\$", 8)), (1.0, 0.25, ("\$\\frac{2^{-2}(k-1) + 1}{2^{n-2}}\$", 8))])
savefig(joinpath(@OUTPUT, "dyadic_points.svg"))
```
\fig{dyadic_points}

Com a caracterização acima, podemos escrever
$$
\left\{\omega; \;\exists t_0 \in [0, 1), \;\limsup_{\tau \rightarrow 0} \frac{|W_{t_0+\tau}(\omega) - W_{t_0}(\omega)|}{\tau} < \infty \right\} = \bigcup_{M\in\mathbb{N}} \bigcap_{m\in \mathbb{N}}\bigcup_{n \geq m} \left\{\omega; \;\exists t_0 \in [0, 1), \;\sup_{\tau\in (0,2^{-n+2}]} \frac{|W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)|}{\tau} \leq M\right\}
$$

Observe que também podemos escrever que o conjunto à esquerda é a união em $M$ e em $n$ dos conjuntos mais à direita, mas não é tão simples mostrar que os conjuntos mais à direita têm medida nula. É mais fácil trabalhar refinando a malha e escrevendo a interseção das uniões, ou seja, como um limite superior, para aplicarmos o Lema de Borel-Cantelli. Nesse caso, basta mostrar que as medidas dos conjuntos mais à esquerda são somáveis em $n.$

Considere, então, as malhas diádicas $\{k/2^n, \;k=0, \ldots, 2^n\}$, $n\in \mathbb{N}$. O ponto $t_0$ pode estar em qualquer um dos intervalos definidos por essa malha. Logo, podemos escrever
$$
\left\{\omega; \;\exists t_0 \in [0, 1), \;\sup_{\tau\in (0,2^{-n+2}]} \frac{|W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)|}{\tau} \leq M\right\} = \bigcup_{k = 1, \ldots, 2^n}\left\{\omega; \;\exists t_0 \in \left[\frac{k-1}{2^n}, \frac{k}{2^n}\right), \;\sup_{\tau\in (0,2^{-n+2})} \frac{|W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)|}{\tau} \leq M\right\}
$$

Suponha que $t_0$ pertença a um determinado intervalo $(k-1)/2^n \leq t_0 < k/2^n$. Considere os incrementos $W_{(k+j)/2^n} - W_{(k+j-1)/2^n}$, para $j=1, 2, 3$. Observe que
$$
t_0 < \frac{k}{2^n} < \frac{k+j}{2^n} = \frac{k-1}{2^n} + \frac{j+1}{2^n} \leq \frac{k-1}{2^n} + \frac{4}{2^{n}} \leq t_0 + \frac{1}{2^{n-2}}.
$$
Assim, todos os pontos $k/2^n$ e $(k+j)/2^n$, para $j=1, 2, 3$, são da forma $t_0 + \tau$, para $\tau$ no intervalo $(0, 2^{-n+2}]$. 

```julia:dyadic_points_increments
#hideall
using Plots
theme(:ggplot2)
t0 = 0.07
t = range(0.27, 0.48, length = 20)
t1 = range(t0 + 0.02, 0.23, length = 10)
t2 = range(t0 + 0.02, 0.48, length = 30)
t3 = range(t0 + 0.02, 0.73, length = 50)
t4 = range(t0 + 0.02, 0.98, length = 70)

x = 0.25 * sin.(π * (t .- 0.25) ./ 0.25)
x1 = -0.05 * sin.(π * (t1 .- t0) ./ (0.25 - t0))
x2 = -0.2 * sin.(π * (t2 .- t0) ./ (0.50 - t0))
x3 = -0.45 * sin.(π * (t3 .- t0) ./ (0.75 - t0))
x4 = -0.8 * sin.(π * (t4 .- t0) ./ (1.0 - t0))

tt = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:2:3]

plot(title = "Incrementos", titlefont = 10, xaxis = "\$t\$", yaxis = false, xlims = (-0.05, 1.05), ylims = (-1, 1), xticks = (0.0:0.25:1.0, ""))

scatter!([j/4 for j in 0:4], [0], markersize = 4, label = false)
scatter!([0.0, 1.0], [0], markersize = 6, label = false)
scatter!((t0, 0.0), markersize = 4, color = :black, label = false)

plot!(t, x, color = :black, label = false)
plot!(0.25 .+ t, x, color = :black, label = false)
plot!(0.5 .+ t, x, color = :black, label = false)

plot!(t1, x1, color = :black, label = false)
plot!(t2, x2, color = :black, label = false)
plot!(t3, x3, color = :black, label = false)
plot!(t4, x4, color = :black, label = false)

annotate!([(0.0, -0.2, ("\$\\frac{(k-1)}{2^n}\$", 8)), (1.0, -0.2, ("\$\\frac{(k+2)}{2^n}\$", 8))])
annotate!([(0.15, 0.12, ("\$t_0\$", 8))])
savefig(joinpath(@OUTPUT, "dyadic_points_increments.svg"))
```
\fig{dyadic_points_increments}

Dessa forma, podemos usar a estimativa acima, em conjunto com a desigualdade triangular, para obter
$$
\begin{align*}
\left|W_{(k+j)/2^n} - W_{(k+j-1)/2^n}\right| & \leq \left|W_{(k+j)/2^n} - W_{t_0}\right| + \left| W_{(k+j-1)/2^n} - W_{t_0}\right| \\
& \leq M\left(\frac{k+j}{2^n} - t_0\right) + M \left(\frac{(k+j-1)}{2^n} - t_0\right) \\
& \leq M\left(\frac{2k+2j-1}{2^n} - \frac{2(k-1)}{2^n}\right) \\
& = \frac{(2j+1)M}{2^n} \\
& \leq \frac{7M}{2^n}.
\end{align*}
$$
Ou seja, para cada $n, M, k$, vale
$$
\left\{\omega; \;\exists t_0 \in \left[\frac{k-1}{2^n}, \frac{k}{2^n}\right), \;\sup_{\tau\in (0,2^{-n+2})} \frac{|W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)|}{\tau} \leq M\right\} \leq \left\{\omega; \;\left|W_{(k+j)/2^n}(\omega) - W_{(k+j-1)/2^n}(\omega)\right| \leq \frac{7M}{2^n}, \;j=1,2,3\right\}.
$$
Com isso,
$$
\left\{\omega; \;\exists t_0 \in [0, 1), \;\limsup_{\tau \rightarrow 0} \frac{|W_{t_0+\tau}(\omega) - W_{t_0}(\omega)|}{\tau} < \infty \right\} \subset \bigcup_{M\in\mathbb{N}} \bigcap_{m\in \mathbb{N}}\bigcup_{n \geq m} E_{M, n},
$$
onde
$$
E_{M, n} = \bigcup_{k = 1, \ldots, 2^n} E_{M, n, k}, \qquad E_{M, n, k} = \left\{\omega; \;\left|W_{(k+j)/2^n}(\omega) - W_{(k+j-1)/2^n}(\omega)\right| \leq \frac{7M}{2^n}, \;j=1,2,3\right\}.
$$

Aqui fica evidente o uso da malha mais grossa, na estimativa da diferença finita, gerando as estimativas nos incrementos na malha mais fina. O motivo do uso desses três incrementos será aparente em seguida.

Vamos mostrar, usando o Lema de Borel-Cantelli, que
$$
\bigcap_{m\in \mathbb{N}}\bigcup_{n \geq m} E_{M, n} = \limsup_{n\rightarrow \infty} E_{M, n} = 0.
$$
Para isso, basta mostrar que
$$
\sum_{n\in \mathbb{N}} \mathbb{P}(E_{M, n}) < \infty.
$$

Como os incrementos são independentes, temos que
$$
\mathbb{P}(E_{M, n, k}) = \prod_{j=1,2,3}\mathbb{P}\left(\left|W_{(k+j)/2^n} - W_{(k+j-1)/2^n}\right| \leq \frac{7M}{2^n}\right) = \prod_{j=1,2,3}\mathbb{P}\left(2^{n/2}\left|W_{(k+j)/2^n} - W_{(k+j-1)/2^n}\right| \leq \frac{7M}{2^{n/2}}\right).
$$

Pela invariância dos processos de Wiener padrão por translações e por rescalonamento (com $a= 2^{n/2}$),
$$
Z_{n, k, j} = 2^{n/2}\left(W_{(k+j)/2^n} - W_{(k+j-1)/2^n}\right) \sim \mathcal{N}(0, 1).
$$
Assim,
$$
\mathbb{P}(E_{M, n, k}) = \prod_{j=1,2,3}\mathbb{P}\left(|Z_{n, k, j}| \leq \frac{7M}{2^{n/2}}\right).
$$

Como a função de distribuição de probabilidade da normal padrão é limitada por $1/\sqrt{2\pi}$, temos
$$
\mathbb{P}\left(|Z_{n, k, j}| \leq r\right) \leq \frac{2r}{\sqrt{2\pi}} \leq r, \qquad \forall r > 0.
$$
Logo,
$$
\mathbb{P}(E_{M, n, k}) \leq \left(\frac{7M}{2^{n/2}}\right)^3.
$$

Portanto,
$$
\mathbb{P}\left(E_{M, n}\right) = \mathbb{P}\left(\bigcup_{k=1, \ldots, 2^n} E_{M, n, k}\right) \leq 2^n \left(\frac{7M}{2^{n/2}}\right)^3 = \frac{7^3M^3}{2^{n/2}}.
$$
Isso nos dá que
$$
\sum_n \mathbb{P}\left(E_{M, n}\right) \leq 7^3M^3\sum_n \frac{1}{2^{n/2}} < \infty.
$$

Aqui revelou-se a importância do uso dos três incrementos. A probabilidade de termos a limitação em um dos incrementos é da ordem de $2^{-n/2}$. Como os incrementos são independentes, a probabilidade de termos a limitação em três incrementos consecutívos é o cubo disso, i.e. da ordem de $2^{-3n/2}$. Como temos $2^n$ conjuntos em cada malha, isso nos dá uma estimativa total ainda pequena, da ordem de $2^{-n/2}$. Se usássemos só um incremento, a estimativa total cresceria exponencialmente. Se usássemos só dois, a estimativa seria uma constante. Mas usando três incrementos, conseguimos uma estimativa decrescendo exponencialmente e sendo, portanto, somável.

Assim, pelo Lema de Borel-Cantelli,
$$
\mathbb{P}\left( \left\{ \exists t_0 \in [0, 1), \; \sup_{\tau\in [0,1]} \frac{|W_{t+\tau} - W_t|}{\tau} \leq M \right\}\right) \leq \mathbb{P}\left(\limsup_{n\rightarrow \infty} E_{M, n}\right) = 0.
$$
Portanto,
$$
\mathbb{P}\left( \left\{ \exists t_0 \in [0, 1), \; \sup_{\tau\in [0,1]} \frac{|W_{t+\tau} - W_t|}{\tau} < \infty \right\}\right) = \lim_{M\rightarrow \infty} \mathbb{P}\left( \left\{ \exists t_0 \in [0, 1), \; \sup_{\tau\in [0,1]} \frac{|W_{t+\tau} - W_t|}{\tau} \leq M \right\}\right) = 0.
$$

Isso conclui a demonstração de que, quase certamente, os caminhos amostrais de um processo de Wiener padrão não são diferenciáveis em nenhum ponto no intervalo $[0, 1)$. Pela invariância por translações, isso se estende para qualquer intervalo $[n, n+1)$. Fazendo a interseção desse conjunto contável, obtemos que, quase certamente, os caminhos amostrais não são diferenciáveis em nenhum ponto $t\geq 0$.
