@def title = "Método de Heun"

# {{ get_title }}

Este método melhora a ordem de convergência para $p = 2$, no caso determinístico. Em casos especiais de ruídos suaves (e.g. processos de transporte com funções suaves) essa ordem $p = 2$ também ocorre em equações aleatórias (veja Neckel & Rupp (2013), Seções 7.3.2 e 7.3.4). Quando o ruído não tem regularidade suficiente, a ordem de convergência para equações aleatórias é menor. No caso estocástico, porém, o método não converge (veja Higham & Kloeden (2021), Seção 17.3).

## Método de Heun no caso determinístico

No caso de uma equação diferencial ordinária
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(t, x),
$$
o método de Heun é um método explícito dado iterativamente por
$$
x_j = x_{j-1} + \frac{1}{2}\left( f(t_{j-1}, x_{j-1}) + f(t_j, x_{j-1} + \Delta t f(t_{j-1}, x_{j-1}))\right)\Delta t.
$$
Ele pode ser visto como uma modificação do método do trapézio, que é um método implícito, tomando a derivada como uma média entre as derivadas no ponto anterior e no seguinte, i.e.
$$
x_j = x_{j-1} + \frac{f(t_{j-1}, x_{j-1}) + f(t_j, x_j)}{2}\Delta t,
$$
ao substituírmos $x_j$ no termo $f(t_j, x_j)$ à direita pelo passo do método de Euler, $x_j \approx x_{j-1} + \Delta t f(t_{j-1}, x_{j-1}).$ Nesse sentido, ele pode ser visto, também, como um método de previsão-correção, onde a previsão é dada pelo método de Euler.

## Método de Heun no caso aleatório

No caso de equações diferenciais aleatórias, o método de Heun converge de forma forte. Veremos simulações sobre isso a seguir.

## Não convergência do método de Heun no caso estocástico

No caso estocástico, no entanto, o método não converge nem fracamante. Para a equação
$$
\mathrm{d}X_t = f(t, X_t)\;\mathrm{d}t + g(t, X_t)\;\mathrm{d}W_t,
$$
o método de Heun toma a forma
$$
\begin{align*}
  X_j = & X_{j-1} + \frac{1}{2} \left( f(t_{j-1}, X_{j-1}) + f(t_j, X_{j-1} + f(t_{j-1}, X_{j-1})\Delta t + g(t_{j-1}, X_{j-1}))\Delta W_{j-1} \right)\Delta t \\
  & + \frac{1}{2} \left( g(t_{j-1}, X_{j-1}) + g(t_j, X_{j-1} + f(t_{j-1}, X_{j-1})\Delta t + g(t_{j-1}, X_{j-1})\Delta W_{j-1}) \right)\Delta W_{j-1}.
\end{align*}
$$

Para ver que esse método pode não convergir, vamos considerar uma equação em particular, a saber
$$
\mathrm{d}X_t = 2X_t\;\mathrm{d}W_t, \quad X_0 = 1,
$$
cuja solução é
$$
X_t = e^{-2t + 2W_t}.
$$
Além disso, podemos escrever
$$
X_t = 1 + \int_0^t 2X_s\;\mathrm{d}W_s.
$$
É fácil ver, desta última expressão, que
$$
\mathbb{E}[X_t] = 1,
$$
já que a integral estocástica tem esperança nula.

Já a aproximação pelo método de Heun, considerando que $f(t, x) = 0$ e $g(t, x) = 2x$, nos dá
$$
\begin{align*}
X_j & = X_{j-1} + \frac{1}{2} \left( 2X_{j-1} + 2(X_{j-1} + 2X_{j-1}\Delta W_{j-1}) \right)\Delta W_{j-1} \\
& = X_{j-1} + 2X_{j-1} \Delta W_{j-1} + 2X_{j-1}(\Delta W_{j-1})^2 \\
& = X_{j-1}\left(1 + 2\Delta W_{j-1} + 2\Delta W_{j-1}^2\right).
\end{align*}
$$
Isso nos dá
$$
X_j = \prod_{i = 0}^{j-1}\left(1 + 2\Delta W_i + 2\Delta W_i^2\right).
$$
Os fatores do produto são independentes entre si, de modo que
$$
\mathbb{E}[X_j] = \prod_{i = 0}^{j-1}\mathbb{E}\left[\left(1 + 2\Delta W_i + 2\Delta W_i^2\right)\right] = \prod_{i = 0}^{j-1}\left(1 + 2\Delta t\right) = \left(1 + 2\Delta t\right)^j.
$$
Assintoticamente, temos
$$
\mathbb{E}[X_j] \sim e^{2j\Delta t} = e^{2t_j}
$$
portanto longe de convergir para $\mathbb{E}[X_t] = 1.$ Isso mostra que o método de Heun, até mesmo para uma simples equação estocástica linear, não converge nem fracamente para a solução exata.
