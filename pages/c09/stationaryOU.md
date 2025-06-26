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
para uma constante apropriada $C.$ É natural procurarmos uma solução simétrica em relação à origem, já que a equação assim o é. Nesse caso, $p'(0) = 0,$ o que nos dá
$$
C = 0.
$$
Observe que, caso $C > 0,$ então
$$
\frac{\sigma^2}{2}\frac{\mathrm{d} p}{\mathrm{d}x}(x) = C - \nu x p(x) \geq C > 0,
$$
para $x < 0,$ visto que $p \geq 0.$ Mas isso nos leva a uma contradição, pois teríamos $p\rightarrow -\infty,$ quando $x \rightarrow -\infty,$ contradizendo o fato de que $p \geq 0.$ Da mesma forma, se $C < 0,$ então
$$
\frac{\sigma^2}{2}\frac{\mathrm{d} p}{\mathrm{d}x}(x) = C - \nu x p(x) \leq C < 0,
$$
para $x > 0.$ Novamente, $p\rightarrow -\infty,$ quando $x \rightarrow \infty,$ contradizendo o fato de que $p\geq 0.$

Portanto, a única solução possível deve satisfazer
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

## Exercícios

1. Encontre a equação de Fokker-Plank para $\nu\;\mathrm{d}X_t = - U'(x)\;\mathrm{d}t + \sigma\;\mathrm{d}W_t$ e mostre que $e^{-2\nu U(x)/\sigma^2}$ é uma solução estacionária da equação (correspondendo a uma solução estacionária da equação diferencial estocástica com função densidade de probabilidade com constante de normalização $\sqrt{2\pi \sigma^2}/2\nu$).
2. Deduza a equação de Fokker-Plank para a densidade $p=p(t, x, y)$ associada ao sistema
$$
\begin{cases}
  \mathrm{d}X_t = Y_t, \\
  \mathrm{d}Y_t = - \nu Y_t \;\mathrm{d}t - U'(X_t) \;\mathrm{d}t + \sigma \;\mathrm{d}W_t
\end{cases}
$$
e mostre que $e^{-(2\nu/\sigma^2)\left(y^2/2 + U(x)\right)}$ é uma solução estacionária da equação.
3. Dada uma densidade de distribuição $q(x) = f(x)/Z$ onde $f > 0$ é uma função integrável e $Z = \int_{-\infty}^\infty f(x)\;\mathrm{d}x$ é uma constante de normalização, podemos escrever essa densidade na forma $q(z) = e^{-U(x)}/Z,$ onde $U(x) = - \ln f(x).$ Assim, vemos que $q(x) = e^{-U(x)}/Z$ é uma solução estacionária da equação diferencial estocástica
$$
\mathrm{d}X_t = \nabla\ln f(x)\;\mathrm{d}t + \sqrt{2}\;\mathrm{d}W_t,
$$
onde $\nabla\ln f(x)$ é chamada de função *score* de Stein e que, nesse caso unidimensional, é simplesmente $\nabla\ln f(x) = \mathrm{d}(\ln f(x))/\mathrm{d}x.$ Com isso em mente, simule numericamente essa equação de Fokker-Planck com condição inicial $X_0 \sim \mathcal{N}(0, 1)$ até um instante $t=T$ suficientemente grande, para gerar amostras aleatórias de uma mistura $(1 - \theta)\mathcal{N}(\mu_1, \sigma_1^2) + \theta\mathcal{N}(\mu_2, \sigma_2^2)$ de Gaussianas, com, por exemplo, $\theta = 1/3$, $ \mu_1 = 3,$ $\sigma = 1,$ $\mu_2 = 7,$ $\sigma_2 = 0.5.$ Faça um histograma normalizado das amostras obtidas para $X_T,$ junto com a PDF da mistura.