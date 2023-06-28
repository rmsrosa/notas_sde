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
\mathrm{Var}(X_t) \rightarrow e^{-2\nu t}\;\mathrm{Var}(X_0) + \frac{\sigma^2}{2\nu}\left(1 - e^{-2\nu t}\right) \rightarrow \frac{\sigma^2}{2\nu},
$$
quando $t \rightarrow \infty.$ Como $X_t$ é um processo Gaussiano, vemos que, no limite $t\rightarrow \infty,$
$$
X_t \rightarrow X_\infty \sim \mathcal{N}\left(0, \frac{\sigma^2}{2\nu}\right).
$$

Isso pode ser obtido, também, através da equação de Fokker-Planck. De acordo com essa equação, a função densidade de probabilidade $p=p(x)$ de uma distribuição estacionária desse processo é dada por
$$
\nu \frac{\mathrm{d}}{\mathrm{d}x}(x p(x)) + \frac{\sigma^2}{2}\frac{\mathrm{d}^2 p}{\mathrm{d}x^2}(x) = 0.
$$
Integrando,
$$
\nu x p(x) + \frac{\sigma^2}{2}\frac{\mathrm{d} p}{\mathrm{d}x}(x) = C,
$$
para uma constante apropriada $C.$ É natural procurarmos uma solução simétrica em relação à origem, já que a equação o é. Nesse caso, $p'(0) = 0,$ o que nos dá
$$
C = 0.
$$
Portanto, procuramos uma solução de
$$
\frac{\mathrm{d} p}{\mathrm{d}x}(x) = - \frac{2 \nu x}{\sigma^2} p(x).
$$
Essa equação é linear e também é separável. De qualquer forma, obtemos a solução
$$
p(x) = C_0 e^{-\frac{\nu x^2}{\sigma^2}},
$$
para alguma constante $C_0.$

Lembramos, agora, que $p=p(x)$ deve ser uma função densidade de probabilidade, i.e.
$$
\int_{-\infty}^\infty p(x) \;\mathrm{d}x = 1.
$$
Sob essas condições, devemos ter
$$
p(x) = \frac{\sqrt{\nu}}{\sqrt{\pi \sigma^2}} e^{- \nu x^2/\sigma^2},
$$
que é, de fato, a função densidade de probabilidade de uma distribuição $\mathcal{N}\left(0, \frac{\sigma^2}{2\nu}\right).$
