@def title = "Distribuição assintótica estacionária dos processos de Ornstein-Uhlenbeck"

# {{ get_title }}

Considere um processo de Ornstein-Uhlenbeck
$$
\mathrm{d}X_t = - \nu X_t \;\mathrm{d}t + \sigma \;\mathrm{d}W_t,
$$
com $\nu, \sigma > 0.$ A sua solução é
$$
X_t = e^{-\nu t}X_0 + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}s.
$$
Vimos, também, que
$$
\mathbb{E}[X_t] = e^{-\nu t}\mathbb{E}[X_0] \rightarrow 0
$$
e
$$
\mathcal{Var}(X_t) \rightarrow e^{-2\nu t}\;\mathcal{Var}(X_0) + \frac{\sigma^2}{2\nu}\left(1 - e^{-2\nu t}) \rightarrow \frac{\sigma^2}{2\nu},
$$
quando $t \rightarrow \infty.$ Como $X_t$ é um processo Gaussiano, vemos que, no limite $t\rightarrow \infty,$
$$
X_t \rightarrow X_\infty \sim \mathcal{N}\left(0, \frac{\sigma^2}{2\nu}\right).
$$

Isso pode ser obtido, também, através da equação de Fokker-Planck. De acordo com essa equação, a função densidade de probabilidade $p=p(x)$ de uma distribuição estacionária desse processo é dada por
$$
-\nu \frac{\mathrm{d}}{\mathrm{d}x}(x p(x)) + \frac{\sigma^2}{2}\frac{\mathrm{d}^2 p}{\mathrm{d}x^2}(x) = 0.
$$
Integrando,
$$
-\nu (x p(x)) + \frac{\sigma^2}{2}\frac{\mathrm{d} p}{\mathrm{d}x}(x) = C,
$$
para uma constante apropriada $C.$ Essa equação diferencial é linear e é possível observar que as suas soluções são da forma
$$
p(x) = K e^{- \nu x^2/\sigma^2}.
$$

Lembramos que $p=p(x)$ deve ser uma função densidade de probabilidade, i.e.
$$
p(x) \geq 0, \qquad \int_{-\infty}^\infty p(x) \;\mathrm{d}x = 1.
$$
Sob essas condições, devemos ter
$$
p(x) = \frac{\sqrt{\nu}}{\sqrt{\pi \sigma^2}} e^{- \nu x^2/\sigma^2},
$$
que é, de fato, a função densidade de probabilidade de uma distribuição $\mathcal{N}\left(0, \frac{\sigma^2}{2\nu}\right).$
