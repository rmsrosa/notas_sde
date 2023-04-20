@def title = "Propriedades de processos de Wiener"

# {{ get_title }}

Um processo de Wiener é um exemplo de processo Gaussiano. Para ver isso, dados $t_1, \ldots, t_n \geq 0$, podemos escrever cada $W_{t_1}, \ldots, W_{t_n}$ como combinação linear das normais independentes $W_{t_1} - W_{t_0}$, $W_{t_2} - W_{t_1}$, ..., $W_{t_n} - W_{t_{n-1}}$, onde $t_0 = 0$, i.e.
$$
W_{t_j} = W_{t_j} - W_{t_{j-1}} + \cdots + W_{t_1} - W_{t_0}.
$$
Dessa forma, a distribuição conjunta de $W_{t_1}, \ldots, W_{t_n}$ é dada por
$$
\mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} \leq x_n) = \mathbb{P}(W_{t_1} - W_{t_0} \leq x_1, \ldots, W_{t_n} - W_{t_{n-1}} + \cdots + W_{t_1} - W_{t_0} \leq x_n)
$$
Isso pode ser reescrito na forma
$$
\mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} \leq x_n) = \mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} - W_{t_{n-1}} \leq x_n - \cdots - x_1) = F(x_1, \ldots, x_n - \cdots - x_1),
$$
onde $F$ é a função de distribuição acumulada da normal multivariada associada às normais independentes $W_{t_1} - W_{t_0}, \ldots, W_{t_n} - W_{t_{n-1}}$. Portanto, $\{W_t\}_{t\geq 0}$ é um processo Gaussiano.

Note, ainda, que, como $W_0 = 0$ e $W_t - W_0 \sim \mathcal{N}(0, t)$, então
$$
\mathbb{E}[W_t] = \mathbb{E}[W_t - X_0] = 0
$$
e
$$
\mathrm{Var}(W_t) = \mathrm{Var}(W_t - W_0) = t.
$$
Além disso, para quaisquer $t \geq s \geq 0$, como os incrementos são independentes e, portanto, tem correlação nula,
$$
\begin{align*}
\mathrm{Cov}(W_t, W_s) & = \mathrm{Cov}(W_s + W_t - W_s, W_s) = \mathrm{Cov}(W_s, W_s) + \mathrm{Cov}(W_t - W_s, W_s) \\ & = \mathrm{Cov}(W_s - W_0, W_s - W_0) + \mathrm{Cov}(W_t - W_s, W_s - W_0) = \mathrm{Var}(W_s - W_0) = s.
\end{align*}
$$
Observe que, se $t = s > 0$, então o segundo termo se anula pois $W_t - W_s = 0$. Já se $t \geq s = 0$, então todos os termos se anulam, já que $W_s - W_0 = 0$. De qualquer forma, podemos escrever, para $t, s \geq 0$ quaisquer,
$$
\mathrm{Cov}(W_t, W_s) = \min\{t, s\}.
$$

Observe que, por definição, dois incrementos $W_{t_3} - W_{t_2}$ e $W_{t_1} - W_{t_0}$ são independentes quando $t_3 > t_2 = t_1 > t_0$. Isso se estende ao caso em que $t_2 > t_1$, pois basta acrescentar $W_{t_2} - W_{t_1}$ que teremos três incrementos independentes $W_{t_3} - W_{t_2}$, $W_{t_2} - W_{t_1}$ e $W_{t_1} - W_{t_0}$, e quaisquer dois deles também são independentes. Mas os incrementos $W_{t_3} - W_{t_2}$ e $W_{t_1} - W_{t_0}$ não são independentes quando $t_0 < t_2 < t_1 < t_3$. De fato, nesse caso, temos
$$
\begin{align*}
\mathbb{E}((W_{t_3} - W_{t_2})(W_{t_1} - W_{t_0})) & = \mathbb{E}(W_{t_3}W_{t_1} - W_{t_2}W_{t_1} - W_{t_3}W_{t_0} + W_{t_0}W_{t_2}) \\
& = \min\{t_3, t_1\} - \min\{t_2, t_1\} - \min\{t_3, t_0\} + \min\{t_0, t_2\} \\
& = t_1 - t_2 + t_0 - t_0 = t_1 - t_2 > 0.
\end{align*}
$$
Novamente, vemos que, se $t_1 = t_2$, então essa correlação se anula.

Um processo de Wiener não é estacionário, pois, em particular, os processos $W_t$ não tem a mesma lei de probabilidades. E também não é fracamente estacionário, já que, apesar de $\mathbb{E}[W_t] = 0$ ser constante, temos, para $t, s\geq 0$ e $\tau > 0$, que
$$
\begin{align*}
\mathbb{E}[W_{t + \tau}W_{s + \tau}] & = \mathbb{E}[(W_{t + \tau} - \mathbb{E}[W_{t + \tau}])(W_{s + \tau} - \mathbb{E}[W_{s + \tau}])] \\
& = \mathrm{Cov}(W_{t + \tau}, W_{s + \tau}) = \min\{t + \tau, s + \tau\} = \min\{t, s\} + \tau,
\end{align*}
$$
Ou seja, $\mathbb{E}[W_{t + \tau}W_{s + \tau}]$ depende de $\tau$.

Vamos concluir afirmando que um processo Gaussiano $\{W_t\}_{t\geq 0}$ com $\mathbb{E}[W_t] = 0$ e $\mathbb{E}[W_t W_s] = \min\{t, s\}$, para todo $t, s \geq 0$, é um processo de Wiener. A demonstração, no entanto, não é tão imediata e não a faremos aqui.

## "Derivada" de um processo de Wiener como ruído branco

Seguimos, aqui, a derivação feita no Capítulo 3.8 de Higham & Kloeden (2021). Lembremos que um processo estacionário $\{X_t\}_t$ é um ruído branco quando a sua função de covariância $c(\tau) = \mathrm{Cov}(X_{t+\tau}X_t)$ é uma distribuição da forma
$$
c(\tau) = \sigma_0^2\delta_0,
$$
para alguma $\sigma_0 > 0$ e onde $\delta_0$ é a delta de Dirac. Assim, o seu espectro $\hat c(\varpi)$ é, de fato, constante (usamos $\varpi$, aqui, para denotar a frequência, já que $\omega$ é usado como elemento do espaço amostral):
$$
\hat c(\varpi) = \frac{1}{\sqrt{2\pi}} \int_{-\infty}^\infty c(\tau) e^{-i\varpi \tau} \;\mathrm{d}\tau = \frac{1}{2\pi}\varpi^2, \quad \forall \varpi \in \mathbb{R}.
$$

Vamos considerar as diferenças finitas de um processo de Wiener $\{W_t\}_{t\geq 0}$:
$$
D_h^+(t) = \frac{W(t+h) - W(t)}{h}.
$$
Defina
$$
c_h(t, s) = \mathbb{E}\left[ D_h^+(t)D_h^+(s)\right] = \mathbb{E}\left[ \left(\frac{W(t+h) - W(t)}{h} \right) \left(\frac{W(s+h) - W(s)}{h}\right)\right].
$$
Expandindo, temos
$$
c_h(t, s) = \frac{1}{h^2}\mathbb{E}\left[ W(t+h)W(s + h) - W(t)W(s + h) - W(t + h)W(s) + W(t)W(s)\right].
$$
Usando a expressão para a covariância de um processo de Wiener, obtemos
$$
c_h(t, s) = \frac{1}{h^2}\left( \min\{t + h, s + h\} - \min\{t, s + h\} - \min\{t + h, s\} + \min\{t, s\}\right).
$$
Observe que, se $t \leq s - h$, então
$$
c_h(t, s) = \frac{1}{h^2}\left( (t + h) - t - (t + h) + t \right) = 0.
$$
Se $s - h \leq t \leq s$, então
$$
c_h(t, s) = \frac{1}{h^2}\left( (t + h) - t - s + t \right) = \frac{t + h - s}{h^2},
$$
que é linearmente crescente, de $0$ a $1/h$. Se $s \leq t \leq s + h$, então
$$
c_h(t, s) = \frac{1}{h^2}\left( (s + h) - t - s + s \right) = \frac{h + s - t}{h^2},
$$
que é linearmente decrescente, de $1/h$ a $0$. Por último, se $t \geq s + h$, então
$$
c_h(t, s) = \frac{1}{h^2}\left( (s + h) - (s + h) - s + s \right) = 0.
$$

Assim,
$$
c_h(t, s) = \frac{1}{h^2}\begin{cases}
0, & t \leq s - h, \\
t + h - s, & s - h \leq t \leq s, \\
h + s - h, & s \leq t \leq s + h, \\
0, & t \geq s + h.
\end{cases}
$$

```julia:diffwiener_hatfunction
#hideall
using Plots
theme(:ggplot2)
t0 = 0.0
t1 = 4.0
s = 2.0
h = 0.5
tt = range(t0, t1, length = 200)
dh(t, s, h) = (min(t+h, s+h) - min(t, s+h) - min(t+h, s) + min(t,s))/h^2

plot(tt, t -> dh(t, s, h), xaxis = "tempo", yaxis = "valor", title = "Covariância Dₕ⁺(t, s) das diferenças finitas de um processo de Wiener\ncom s = $s e h = $h", titlefont = 8, label = false)
savefig(joinpath(@OUTPUT, "diffwiener_hatfunction.svg"))
```
\fig{diffwiener_hatfunction}

Observe, ainda, que
$$
\int_\mathbb{R} c_h(t, s) \;\mathrm{d}t = 1, \qquad \forall s\in \mathbb{R}.
$$
Ou seja, no limite, temos, de fato, uma delta de Dirac:
$$
c_h(\cdot, s) \rightarrow \delta_s, \qquad h \rightarrow 0.
$$
