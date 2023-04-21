@def title = "Relação com ruído branco"

# {{ get_title }}

Como já vimos, o conceito de processo do tipo ruído branco é delicado. Deve ser um processo estacionário com esperança nula, $\mathbb{E}[X_t] = 0,$ variância constante $\mathrm{Var}(X_t) = \mathbb{E}[X_t^2] = \sigma^2$ e cuja covariância $c(t-s) = \mathrm{Cov}(X_t, X_s)$ é uma delta de Dirac:
$$
    c(\tau) = \sigma_0^2\delta_0.
$$
Assim, o seu espectro $\hat c(\varpi)$ é, de fato, constante (usamos $\varpi$, aqui, para denotar a frequência, já que $\omega$ é usado como elemento do espaço amostral):
$$
\hat c(\varpi) = \frac{1}{\sqrt{2\pi}} \int_{-\infty}^\infty c(\tau) e^{-i\varpi \tau} \;\mathrm{d}\tau = \frac{1}{\sqrt{2\pi}}\varpi^2, \quad \forall \varpi \in \mathbb{R}.
$$

Formalizar isso necessita de um espaço apropriado de distribuições. Não faremos os detalhes formais por aqui. O objetivo é apenas estabelecer conexões informais de que, em alguma sentido apropriado, a *derivada* de um processo de Wiener é um ruído branco.

## Via representação 

A primeira conexão pode ser obtida via representação de Paley-Wiener de um processo de Wiener, dada por
$$
    W_t = \frac{t}{\sqrt{2\pi}} Z_0 + \frac{2}{\sqrt{2\pi}}\sum_{n=1}^\infty \frac{\sin(\frac{1}{2}nt)}{n}Z_n, \qquad 0 \leq t \leq 2\pi.
$$

Formalmente, derivando a série termo a termo, temos que a derivada temporal $\dot W_t$ do processo se escreve como
$$
    \dot W_t = \frac{1}{\sqrt{2\pi}} Z_0 + \frac{1}{\sqrt{2\pi}}\sum_{n=1}^\infty \sin(\frac{1}{2}nt)Z_n, \qquad 0 \leq t \leq 2\pi,
$$
de modo que os coeficientes de Fourier são constantes.

É claro que a série acima não converge em um sentido clássico. Mas serve como conexão com a ideia da derivada ser um ruído branco. De qualquer forma, um sentido mais preciso pode ser dado em um espaço apropriado de distribuições.

## Limite de diferenças finitas de um processo de Wiener

A outra conexão pode ser vista mostrando-se que os processos obtidos via diferenças finitas de um processo de Wiener tem covariância convergindo para um delta de Dirac. Para isso, seguimos a derivação feita no Capítulo 3.8 de Higham & Kloeden (2021).

Vamos considerar as diferenças finitas $\{D^h_t\}_{t\geq 0}$ de um processo de Wiener $\{W_t\}_{t\geq 0}$, para cada $h>0:$
$$
D^h_t = \frac{W_{t+h} - W_t}{h}.
$$
Defina
$$
c_h(t, s) = \mathbb{E}\left[ D^h_tD^h_s\right] = \mathbb{E}\left[ \left(\frac{W_{t+h} - W_t}{h} \right) \left(\frac{W_{s+h} - W_{s}}{h}\right)\right].
$$
Expandindo, temos
$$
c_h(t, s) = \frac{1}{h^2}\mathbb{E}\left[ W_{t+h}W_{s+h} - W_tW_{s+h} - W_{t+h}W_{s} + W_tW_{s}\right].
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
