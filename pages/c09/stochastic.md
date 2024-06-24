@def title = "Equação de Fokker-Planck no caso de equações estocásticas"

# {{ get_title }}

Considere, agora, uma equação diferencial estocástica
$$
\mathrm{d}X_t = f(t, X_t)\;\mathrm{d}t + g(t, X_t)\;\mathrm{d}W_t,
$$
com uma condição initial
$$
\left. X_t \right|_{t = 0} = X_0.
$$

Suponhamos, para todos os efeitos, que exista uma solução  definida pelo menos em um intervalo de tempo $[0, T]$. Suponhamos, ainda, que cada $X_t$ tenha uma função densidade de probabilidade $p(t, x)$ bem definida. A questão que queremos investigar é sobre a evolução dessa função.

Vamos considerar funções testes $\Phi(t, x)$ que se anulem nos extremos do intervalo temporal, i.e. $\Phi(T, x) = \Phi(0, x) = 0$, e que decaiam suficientemente rápido quando $|x|\rightarrow \infty.$

Temos, pela fórmula de Itô, que
$$
\Phi(t, X_T) = \Phi(0, X_0) + \int_0^T \left(\Phi_t(t, X_t) + \Phi_x(t, X_t)f(t, X_t) + \frac{1}{2}\Phi_{xx}(t, X_t)g(t, X_t)^2\right)\;\mathrm{d}t + \int_0^T \Phi_x(t, X_t)g(t, X_t)\;\mathrm{d}W_t.
$$
Como $\Phi$ se anula em $t=0$ e $t=T,$ obtemos
$$
\int_0^T \left(\Phi_t(t, X_t) + \Phi_x(t, X_t)f(t, X_t) + \frac{1}{2}\Phi_{xx}(t, X_t)g(t, X_t)^2\right)\;\mathrm{d}t + \int_0^T \Phi_x(t, X_t)g(t, X_t)\;\mathrm{d}W_t = 0.
$$

Tomando o valor esperado, chegamos a
$$
\int_0^T \mathbb{E}\left[\Phi_t(t, X_t) + \Phi_x(t, X_t)f(t, X_t) + \frac{1}{2}\Phi_{xx}(t, X_t)g(t, X_t)^2\right]\;\mathrm{d}t = 0.
$$
Em termos da função densidade de probabilidade,
$$
\int_0^T \int_{-\infty}^{\infty} \left(\Phi_t(t, x) + \Phi_x(t, x)f(t, x) + \frac{1}{2}\Phi_{xx}(t, x)g(t, x)^2\right)p(t, x)\;\mathrm{d}x\;\mathrm{d}t = 0.
$$

Integrando por partes, em $t$, a primeira integral, temos
$$
\begin{align*}
\int_0^T \int_{-\infty}^{\infty} \Phi_t(t, x) p(t, x)\;\mathrm{d}x\;\mathrm{d}t & = \int_{-\infty}^{\infty} \int_0^T \Phi_t(t, x) p(t, x)\;\mathrm{d}t \;\mathrm{d}x \\
& = \int_{-\infty}^{\infty} \left( \Phi(T, x) - \Phi(T, 0) - \int_0^T \Phi(t, x) p_t(t, x)\;\mathrm{d}t \right) \;\mathrm{d}x.
\end{align*}
$$
Novamente, como $\Phi(t, x)$ se anula em $t=0$ e $t=T,$ isso nos dá
$$
\int_0^T \int_{-\infty}^{\infty} \Phi_t(t, x) p(t, x)\;\mathrm{d}x\;\mathrm{d}t = -\int_{-\infty}^{\infty} \int_0^T \Phi(t, x) \frac{\partial p}{\partial t}(t, x)\;\mathrm{d}t \;\mathrm{d}x.
$$

Integrando as outras duas integrais por partes em $x,$ temos
$$
\begin{align*}
\int_0^T \int_{-\infty}^{\infty} & \left(\Phi_x(t, x)f(t, x) + \frac{1}{2}\Phi_{xx}(t, x)g(t, x)^2\right)p(t, x)\;\mathrm{d}x\;\mathrm{d}t \\
& = \int_0^T \int_{-\infty}^{\infty} \left(-\Phi(t, x)\frac{\partial}{\partial x}(f(t, x)p(t, x)) + \frac{1}{2}\Phi(t, x)\frac{\partial^2}{\partial x^2}(g(t, x)^2 p(t, x))\right)\;\mathrm{d}x\;\mathrm{d}t.
\end{align*}
$$
Juntando os termos, chegamos a
$$
\int_0^T \int_{-\infty}^{\infty} \left(-\frac{\partial p}{\partial t}(t, x) -\frac{\partial}{\partial x}(f(t, x)p(t, x)) + \frac{1}{2}\frac{\partial^2}{\partial x^2}(g(t, x)^2 p(t, x))\right)\Phi(t, x)\;\mathrm{d}x\;\mathrm{d}t.
$$

Como a função teste é arbitrária, chegamos na **equação de Fokker-Planck** para a evolução da distribuição de probabilidades
$$
\frac{\partial p}{\partial t}(t, x) + \frac{\partial}{\partial x}(f(t, x)p(t, x)) - \frac{1}{2}\frac{\partial^2}{\partial x^2}(g(t, x)^2 p(t, x)) = 0.
$$

Essa também é conhecida como **equações progressivas de Kolmogorov para equações diferenciais estocásticas,** ou **forward Kolmogorov diffusion equation.** As equações de Kolmogorov (progressivas ou regressivas - *forward* or *backward*) são definidas em contextos mais gerais de processos de Markov com tempo contínuo e espaço discreto ou contínuo.
