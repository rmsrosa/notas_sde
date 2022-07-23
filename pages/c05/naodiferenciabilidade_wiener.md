@def title = "Não diferenciabilidade quase sempre dos caminhos amostrais"

# {{ get_title }}

Caso os caminhos amostrais de um processo de Wiener $\{W_t\}_{t\geq 0}$ fossem diferenciáveis em um instante $t$, teríamos a existência, quase sempre, do limite
$$
\lim_{\tau \rightarrow 0} \frac{W_{t+\tau} - W_t}{\tau}.
$$
Em particular, teríamos
$$
\limsup_{\tau \rightarrow 0} \frac{|W_{t+\tau} - W_t|}{\tau} < \infty.
$$
quase sempre. Porém, isso não é verdade. Mais do que isso. Esse limite superior é infinito com probabilidade um. Em particular, com probabilidade um, os caminhos amostrais não são diferenciáveis em instante algum.

## Não diferenciabilidade na origem

Vamos começar ilustrando isso no instante $t = 0$. Temos
$$
\lim_{\tau\rightarrow 0} \frac{W_\tau - W_0}{\tau} = \lim_{\tau\rightarrow 0} \frac{W_\tau}{\tau}.
$$

Lembrando da propriedade de simetria por rescalonamento, considere os processos de Wiener definidos por
$$
V_t^a = \frac{1}{a}W_{a^2t}, \qquad t \geq 0,
$$
para $a > 0$.

Ambos $\{W_t\}_{t \geq 0}$ e $\{V_t^a\}_{t\geq 0}$ são processos de Wiener padrão, com mesma lei de probabilidades $W_t, V_t^a \sim \mathcal{N}(0, t)$. Portanto,
$$
\mathbb{P}(|W_\tau| \leq r) = \mathbb{P}(|V_\tau^a| \leq r), \qquad \forall r \geq 0.
$$
Assim,
$$
\mathbb{P}(|W_\tau| \leq r) = \mathbb{P}(|V_\tau^a| \leq r) = \mathbb{P}\left(\frac{|W_{a^2\tau}|}{a} \leq r\right).
$$

Escolhendo $a = 1/\sqrt{\tau}$, temos
$$
\mathbb{P}(|W_\tau| \leq r) = \mathbb{P}\left(\sqrt{\tau}|W_{1}| \leq r\right).
$$
Podemos escrever isso na forma
$$
\mathbb{P}\left(\frac{|W_\tau|}{\tau} \leq \frac{r}{\tau}\right) = \mathbb{P}\left(|W_{1}| \leq \frac{r}{\sqrt{\tau}}\right).
$$

Escolhendo, agora, $r = \tau^{3/4}$, obtemos
$$
\mathbb{P}\left(\frac{|W_\tau|}{\tau} \leq \frac{1}{\tau^{1/4}}\right) = \mathbb{P}\left(|W_{1}| \leq \tau^{1/4}\right).
$$

Como $W_1 \sim \mathcal{N}(0, 1)$, temos que
$$
\mathbb{P}(|W_1| \leq \tau^{1/4}) \rightarrow 0, \qquad \tau \rightarrow 0.
$$
Portanto, para qualquer $\varepsilon > 0$, existe $\tau > 0$ tal que
$$
\mathbb{P}\left(\frac{|W_\tau|}{\tau} \leq \frac{1}{\tau^{1/4}}\right)\leq \varepsilon.
$$
Escolhemos uma sequência $\{\varepsilon_n\}_{n\in\mathbb{N}}$ tal que $\varepsilon_n > 0$ e $\sum_n \varepsilon_n < \infty.$ (Por exemplo, $\varepsilon_n = 2^{-n}$.) Agora, dado $M > 0$, escolhemos, para cada $n$, instantes $\tau_n$ tais que $0 < \tau_n \leq 1/M^4$ e
$$
\mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq \frac{1}{\tau_n^{1/4}}\right) \leq \varepsilon_n.
$$
Assim,
$$
\sum_{n=1}^\infty \mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq M\right) \leq \sum_{n=1}^\infty \mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq \frac{1}{\tau_n^{1/4}}\right) \leq \sum_n \varepsilon_n < \infty
$$

Segue, então, pelo Lema de Borel-Cantelli, que
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} E_n^M\right) = 0,
$$
onde
$$
E_n^M = \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M \right\}.
$$
Temos
$$
\limsup_{n\rightarrow \infty} E_n^M = \bigcap_{n\in\mathbb{N}}\bigcup_{j\geq n} E_j^M = \left\{\omega; \;\forall n\in \mathbb{N}, \exists j \geq n, \;\frac{|W_{\tau_j}|}{\tau_j} \leq M \right\}
$$
Observe que
$$
\left\{\omega; \; \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} < M \right\} \subset \left\{\omega; \;\forall n\in \mathbb{N}, \exists j \geq n, \;\frac{|W_{\tau_j}|}{\tau_j} \leq M \right\} = \limsup_{n\rightarrow \infty} E_n^M.
$$
Portanto,
$$
\mathbb{P}\left(\limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} \leq M\right) = 0.
$$
Nesse momento, essa estimativa é válida para qualquer $M>0$. Como
$$
\left\{ \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} < \infty \right\} = \bigcup_{M\in \mathbb{N}} \left\{ \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} \leq M \right\},
$$
deduzimos que
$$
\mathbb{P}\left( \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} < \infty \right) = 0.
$$

Isso mostra que, com probabilidade um, os caminhos amostrais não são diferenciáveis em $t = 0$.

## Não diferenciabilidade em nenhum ponto

Como um processo de Wiener é invariante por translações, aplicando o resultado acima a $V_t^s = W_{s + t} - W_s$, para $s \geq 0$, segue que, para qualquer $t \geq 0$, quase todo caminho amostral é não diferenciável no instante $t$. Mas isso não é o mesmo que dizer que quase todo caminho amostral é não diferenciável em nenhum dos instantes $t \geq 0$. Isso também é verdade, mas não segue diretamente do resultado acima. Veremos isso a seguir.

## Quase todo caminho amostral é não diferenciável em nenhum ponto

O resultado anterior diz que, para todo $t \geq 0$ dado, os caminhos amostrais são quase todos não diferenciáveis em $t$. Um resultado mais forte é dizer que quase todo caminho amostral não é diferenciável em nenhum ponto. Isso também é verdade, mas a demonstração é mais delicada, como veremos agora. Vamos seguir essencialmente a demonstração em Mörters & Peres (2010), com pequenas modificações.

Começamos mostrando a não diferenciabilidade no intervalo $[0, 1)$. Seja $t \mapsto W_t(\omega)$ um caminho amostral tal que, para algum $0\leq t_0 < 1$,
$$
\limsup_{\tau \rightarrow 0} \frac{W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)}{\tau} < \infty.
$$

Isso acontece se, e somente se, existem $m, M \in \mathbb{N}$ tais que
$$
\sup_{\tau\in (0,2^{-n+2}]} \frac{W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)}{\tau} \leq M, \qquad \forall n \geq m.
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
\left\{\omega; \;\exists t_0 \in [0, 1), \;\limsup_{\tau \rightarrow 0} \frac{W_{t_0+\tau}(\omega) - W_{t_0}(\omega)}{\tau} < \infty \right\} = \bigcup_{M\in\mathbb{N}} \bigcap_{m\in \mathbb{N}}\bigcup_{n \geq m} \left\{\omega; \;\exists t_0 \in [0, 1), \;\sup_{\tau\in (0,2^{-n+2}]} \frac{W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)}{\tau} \leq M\right\}
$$

Considere as malhas diádicas $\{k/2^n, \;k=0, \ldots, 2^n\}$, $n\in \mathbb{N}$. O ponto $t_0$ pode estar em qualquer um dos intervalos definidos por essa malha. Logo, podemos escrever
$$
\left\{\omega; \;\exists t_0 \in [0, 1), \;\sup_{\tau\in (0,2^{-n+2}]} \frac{W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)}{\tau} \leq M\right\} = \bigcup_{k = 1, \ldots, 2^n}\left\{\omega; \;\exists t_0 \in \left[\frac{k-1}{2^n}, \frac{k}{2^n}\right), \;\sup_{\tau\in (0,2^{-n+2})} \frac{W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)}{\tau} \leq M\right\}
$$

Suponha que $t_0$ pertença a um determinado intervalo $(k-1)/2^n \leq t_0 < k/2^n$. Considere o incremento $W_{(k+j)/2^n} - W_{(k+j-1)/2^n}$, para $j=1, 2, 3$. Observe que
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
\left\{\omega; \;\exists t_0 \in \left[\frac{k-1}{2^n}, \frac{k}{2^n}\right), \;\sup_{\tau\in (0,2^{-n+2})} \frac{W_{t_0 + \tau}(\omega) - W_{t_0}(\omega)}{\tau} \leq M\right\} \leq \left\{\omega; \;\left|W_{(k+j)/2^n}(\omega) - W_{(k+j-1)/2^n}(\omega)\right| \leq \frac{7M}{2^n}, \;j=1,2,3\right\}.
$$
Com isso,
$$
\left\{\omega; \;\exists t_0 \in [0, 1), \;\limsup_{\tau \rightarrow 0} \frac{W_{t_0+\tau}(\omega) - W_{t_0}(\omega)}{\tau} < \infty \right\} \subset \bigcup_{M\in\mathbb{N}} \bigcap_{m\in \mathbb{N}}\bigcup_{n \geq m} E_n,
$$
onde
$$
E_n = \bigcup_{k = 1, \ldots, 2^n} \Omega_{n, M, k}, \qquad \Omega_{n, M, k} = \left\{\omega; \;\left|W_{(k+j)/2^n}(\omega) - W_{(k+j-1)/2^n}(\omega)\right| \leq \frac{7M}{2^n}, \;j=1,2,3\right\}.
$$

Aqui fica evidente o uso da malha mais grossa, na estimativa da diferença finita, gerando as estimativas nos incrementos na malha mais fina. O motivo do uso desses três incrementos será aparente em seguida.

Vamos mostrar, usando o Lema de Borel-Cantelli, que
$$
\bigcap_{m\in \mathbb{N}}\bigcup_{n \geq m} E_n = \limsup_{n\rightarrow \infty} E_n = 0.
$$
Para isso, basta mostrar que
$$
\sum_{n\in \mathbb{N}} \mathbb{P}(E_n) < \infty.
$$

Como os incrementos são independentes, temos que
$$
\mathbb{P}(\Omega_{n, k}) = \Pi_{j=1,2,3}\mathbb{P}\left(\left|W_{(k+j)/2^n} - W_{(k+j-1)/2^n}\right| \leq \frac{7M}{2^n}\right).
$$

Pela invariância dos processos de Wiener padrão por translações e por rescalonamento (com $a= 2^{n/2}$),
$$
W_{(k+j)/2^n} - W_{(k+j-1)/2^n} \sim W_{1/2^n} \sim \frac{1}{2^{n/2}}W_1.
$$
Ou, de outra forma,
$$
2^{n/2}\left(W_{(k+j)/2^n} - W_{(k+j-1)/2^n}\right) \sim W_1.
$$
Assim,
$$
\mathbb{P}(\Omega_{n, k}) = \Pi_{j=1,2,3}\mathbb{P}\left(|W_1| \leq \frac{7M}{2^{n/2}}\right).
$$

Como a função de distribuição de probabilidade da normal padrão é limitada por $1/\sqrt{2\pi}\leq 1/2$, temos
$$
\mathbb{P}\left(|W_1| \leq r\right) \leq \frac{2r}{\sqrt{2\pi}} = r, \qquad r > 0.
$$
Logo,
$$
\mathbb{P}(\Omega_{n, k}) \leq \left(\frac{7M}{2^{n/2}}\right)^3.
$$

Portanto,
$$
\mathbb{P}\left(\bigcup_{k=1, \ldots, 2^n} \Omega_{n, k}\right) \leq 2^n \left(\frac{7M}{2^{n/2}}\right)^3 = \frac{7^3M^3}{2^{n/2}}.
$$
Isso nos dá que
$$
\sum_n \mathbb{P}\left(\bigcup_{k=1, \ldots, 2^n - 3} \Omega_{n, k}\right) \leq 7^3M^3\sum_n \frac{1}{2^{n/2}} < \infty.
$$

Aqui revelou-se a importância do uso dos três incrementos. A probabilidade de termos a limitação em um dos incrementos é da ordem de $2^{-n/2}$. Como os incrementos são independentes, a probabilidade de termos a limitação em três incrementos consecutívos é o cubo disso, i.e. da ordem de $2^{-3n/2}$. Como temos $2^n$ conjuntos em cada malha, isso nos dá uma estimativa total ainda pequena, da ordem de $2^{-n/2}$. Se usássemos só um incremento, a estimativa total cresceria exponencialmente. Se usássemos só dois, a estimativa seria uma constante. Mas usando três incrementos, conseguimos uma estimativa decrescendo exponencialmente e sendo, portanto, somável.

Assim, pelo Lema de Borel-Cantelli,
$$
\mathbb{P}\left( \left\{ \exists t_0 \in [0, 1), \; \sup_{\tau\in [0,1]} \frac{W_{t+\tau} - W_t}{\tau} \leq M \right\}\right) \leq \mathbb{P}\left(\limsup_{n\rightarrow \infty} \bigcup_{k=1, \ldots, 2^n-3}\Omega_{n, k}\right) = 0.
$$
Ou seja,
$$
\mathbb{P}\left( \left\{ \exists t_0 \in [0, 1), \; \sup_{\tau\in [0,1]} \frac{W_{t+\tau} - W_t}{\tau} < \infty \right\}\right) = 0.
$$

Isso conclui a demonstração de que, quase certamente, os caminhos amostrais de um processo de Wiener padrão não são diferenciáveis em nenhum ponto no intervalo $[0, 1)$. Pela invariância por translações, isso se estende para qualquer intervalo $[n, n+1)$. Fazendo a interseção desse conjunto contável, obtemos que, quase certamente, os caminhos amostrais não são diferenciáveis em nenhum ponto $t\geq 0$.
