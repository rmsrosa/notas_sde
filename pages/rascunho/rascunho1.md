@def title = "Rascunho 1"

# {{ get_title }}

## Ruído branco

Um **ruído branco** *(white noise)* pode ser definido de várias formas, mas é um processo estocástico real contínuo $\{W_t\}_{t \in I}$, onde $I\subset \mathbb{R}$ é um intervalo, tal que $\mathbb{E}[W_t] = 0$; $\mathrm{Var}[W_t] = \sigma^2$ é constante, para algum $0 < \sigma < \infty$; e $\mathrm{Cov}[W_t, W_s] = 0$, para quaisquer $t, s\in I$, $t\neq s$, com $\mathrm{Cov}[W_t, W_{t + \tau}] = \sigma^2\delta_0(\tau)$.

O processo $X_t = \sin(Ut)$, onde $U \sim \mathrm{Unif}([0, 2\pi))$, apesar dos caminhos amostrais serem simples senoidais, é um exemplo de ruído branco. De fato, temos
$$
\mathbb{E}[X_t] = \int_\mathbb{R} x \;\mathrm{P}_{X_t}(x) = \frac{1}{2\pi}\int_0^{2\pi} \sin(ut) \;\mathrm{d}u = 0;
$$
$$
\mathrm{Var}[X_t] = \int_\mathbb{R} x^2 \;\mathrm{P}_{X_t}(x) = \frac{1}{2\pi}\int_0^{2\pi} \sin(ut)^2 \;\mathrm{d}u = \frac{1}{2\pi}\int_0^{2\pi} \frac{1 + \cos(2ut)}{2} \;\mathrm{d}u = \frac{1}{2};
$$
e
$$
\mathrm{Cov}[X_t, X_s] = \frac{1}{2\pi}\int_0^{2\pi} \sin(ut)\sin(us) \;\mathrm{d}u = 0; \quad t \neq s.
$$