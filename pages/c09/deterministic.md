@def title = "Equação do transporte no caso de equações diferenciais ordinárias"

# {{ get_title }}

Considere uma equação diferencial determinística
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(t, x).
$$

Suponha que haja uma incerteza em relação à condição inicial. Isso nos dá a condição inicial como uma variável aleatória $X_0$. Nesse caso, para cada realização $X_0(\omega)$, temos uma solução $t \mapsto X_t(\omega)$ da equação diferencial ordinária aleatória
$$
\begin{cases}
\displaystyle \frac{\mathrm{d}X_t}{\mathrm{d}t} = f(t, X_t), \\
\left. X \right|_{t = 0} = X_0.
\end{cases}
$$

Suponhamos, para todos os efeitos, que essas soluções estejam definidas pelo menos em um intervalo de tempo $[0, T]$. Isso nos leva a um processo $\{X_t\}_{t\in [0, T]}$.

Suponhamos, mais ainda, que cada $X_t$ tenha uma função densidade de probabilidade $p(t, x)$ bem definida. A questão que queremos investigar é sobre a evolução dessa função. Temos, para uma "função teste" $\Phi$ qualquer,
$$
\mathbb{E}[\Phi] = \int_\mathbb{R} \Phi(X_t(\omega))\;\mathrm{d}\mathbb{P}(\omega) = \int_\mathbb{R} \Phi(x)p(t, x) \;\mathrm{d}x.
$$

Derivando em relação ao tempo, obtemos
$$
\frac{\mathrm{d}}{\mathrm{d}t}  \mathbb{E}[\Phi] = \frac{\mathrm{d}}{\mathrm{d}t}  \int_\mathbb{R} \Phi(x)p(t, x) \;\mathrm{d}x = \int_\mathbb{R} \Phi(x)\frac{\partial p}{\partial t}(t, x) \;\mathrm{d}x.
$$

Por outro lado, também temos
$$
\frac{\mathrm{d}}{\mathrm{d}t} \mathbb{E}[\Phi] = \int_\mathbb{R} \Phi'(X_t(\omega))\frac{\mathrm{d}}{\mathrm{d}t}X_t(\omega)\;\mathrm{d}\mathbb{P}(\omega) = \int_\mathbb{R} \Phi'(X_t(\omega))f(t, X_t(\omega))\;\mathrm{d}\mathbb{P}(\omega) = \int_\mathbb{R} \Phi'(x)f(t, x) p(t, x)\;\mathrm{d}x.
$$
Integrando por partes,
$$
\frac{\mathrm{d}}{\mathrm{d}t} \mathbb{E}[\Phi] = - \int_\mathbb{R} \Phi(x)\frac{\partial}{\partial x}\left(f(t, x) p(t, x)\right)\;\mathrm{d}x.
$$

Igualando as duas identidades, temos
$$
\int_\mathbb{R} \Phi(x)\frac{\partial p}{\partial t}(t, x) \;\mathrm{d}x = - \int_\mathbb{R} \Phi(x)\frac{\partial}{\partial x}\left(f(t, x) p(t, x)\right)\;\mathrm{d}x.
$$

Como isso é válido para qualquer $\Phi$, obtemos a equação
$$
\frac{\partial p}{\partial t}(t, x) + \frac{\partial}{\partial x}\left(f(t, x) p(t, x)\right) = 0,
$$
para a evolução da função densidade de probabilidade $p(t, x)$.

No caso de uma equação autônoma
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(x),
$$
obtemos
$$
\frac{\partial p}{\partial t}(t, x) + \frac{\partial}{\partial x}\left(f(x) p(t, x)\right) = 0.
$$
Densidades estacionárias, i.e. $p(t, x) = p(x),$ podem ser obtidas através da equação
$$
\frac{\partial}{\partial x}\left(f(x) p(x)\right) = 0,
$$
ou seja
$$
f(x)p(x) = \textrm{constante},
$$
lembrando que $p$ deve ser uma função densidade de probabilidade, ou seja,
$$
p(x) \geq 0, \quad \int_{-\infty}^\infty p(x);\mathrm{d}x = 1.
$$

Por exemplo, para a equação
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = - x,
$$
a única solução possível é a delta de Dirac com suporte na origem. Tecnicamente, isso não nos dá uma densidade de probabilidade. Mas isso pode ser obtido, de maneira mais rigorosa, como limite, quando $t \mapsto \infty,$ das soluções de
$$
\frac{\partial p}{\partial t}(t, x) - \frac{\partial}{\partial x}\left(x p(t, x)\right) = 0,
$$
com uma dada condição inicial $p(0, x) = p_0(x).$ Procurando uma solução auto-similar
$$
p(t, x) = a(t) p_0(b(t)x),
$$
vemos que $a(t) = b(t) = e^{t},$ ou seja,
$$
p(t, x) = e^{t}p_0(e^{t}x).
$$
Observe que
$$
\int_{-\infty}^\infty p(t, x) \;\mathrm{d}x = \int_{-\infty}^\infty e^{t}p_0(e^{t}x) \;\mathrm{d}x = \int_{-\infty}^\infty p_0(x) \;\mathrm{d}x = 1.
$$
Além disso, para um função $g=g(x)$ contínua e limitada, temos
$$
\begin{align*}
\int_{-\infty}^\infty p(t, x) g(x) \;\mathrm{d}x & = \int_{-\infty}^\infty p(t, x) g(0) \;\mathrm{d}x + \int_{-\infty}^\infty p(t, x) (g(x) - g(0)) \;\mathrm{d}x \\
& = g(0) + \int_{-\infty}^\infty p(t, x) (g(x)-g(0)) \;\mathrm{d}x.
\end{align*}
$$
Pela continuidade da função $g=g(x)$, dado $\varepsilon > 0$, existe $\delta > 0$ tal que $|g(x) - g(0)| \leq \varepsilon$, para $|x|\leq \delta$. Além disso, $g=g(x)$ é limitada, digamos $|g(x)| \leq C.$ Assim,
$$
\begin{align*}
\left|\int_{-\infty}^\infty p(t, x) (g(x)-g(0)) \;\mathrm{d}x\right| & \leq \int_{|x| \leq \delta} p(t, x) |g(x)-g(0)| \;\mathrm{d}x + \int_{|x| \geq \delta} p(t, x) |g(x)-g(0)| \;\mathrm{d}x \\
& \leq \varepsilon \int_{|x| \leq \delta} p(t, x) \;\mathrm{d}x + 2C \int_{|x| \geq \delta} p(t, x) \;\mathrm{d}x \\
& \leq \varepsilon + 2C\int_{|x| \geq \delta} e^{t}p_0(e^{t}x) \;\mathrm{d}x \\
& = \varepsilon + 2C\int_{|x| \geq e^t\delta} p_0(x) \;\mathrm{d}x.
\end{align*}
$$
Quando $t\rightarrow 0,$ a integral acima vai para zero. Além disso, $\varepsilon > 0$ é arbitrário. Logo,
$$
\lim_{t\rightarrow \infty} \int_{-\infty}^\infty p(t, x) (g(x)-g(0)) \;\mathrm{d}x = 0.
$$
Portanto,
$$
\int_{-\infty}^\infty p(t, x) g(x) \;\mathrm{d}x \rightarrow g(0),
$$
mostrando que a solução convergence para a delta de Dirac no sentido das distribuições, i.e.
$$
p(t, x) \stackrel{w}{\rightharpoonup} \delta_0.
$$
