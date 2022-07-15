@def title = "Movimento Browniano geométrico e o preço de ações"

# {{ get_title }}

Um modelo clássico para o preço $P_t$ de uma ação é que a mudança relativa (ou específica) de preço $\mathrm{d}P_t / P_t$ satisfaça
$$
\frac{\mathrm{d}P_t}{P_t} = \mu\;\mathrm{d}t + \sigma\;\mathrm{d}W_t,
$$
onde $\mu > 0$ é o *drift* (tendência?) e $\sigma$, a *volatilidade* da ação. Desse modo,
$$
\mathrm{d}P_t = \mu P_t \;\mathrm{d}t + \sigma P_t\;\mathrm{d}W_t,
$$
com condição inicial sendo o preço atual da ação:
$$
\left.P_t\right|_{t = 0} = p_0.
$$

Essa equação é linear e a sua solução é
$$
P_t = p_0 e^{\left(\mu - \frac{1}{2} \sigma^2\right)t + \sigma W_t}.
$$

## Resolução

Isso segue da fórmula geral, obtida na seção anterior, com $f_0 = 0$, $f_1 = \mu$, $g_0 = 0$ e $g_1 = \sigma$. Podemos, também, chegar nessa solução através de um fator de integração, visto que a equação é linear. Escrevemos
$$
\mathrm{d}P_t - \mu P_t \;\mathrm{d}t = \sigma P_t\;\mathrm{d}W_t.
$$
Analogamente ao caso determinístico (pense em $p' - \mu p = g(t)$), podemos considerar o fator de integração $e^{-\mu t}$. Observe que, derivando o produto $Y_t = P_t e^{-\mu t}$ pela fórmula de Itô, temos
$$
\begin{align*}
\mathrm{d}Y_t & = \mathrm{d}(P_t e^{-\mu t}) \\
& = -\mu P_t e^{-\mu t}\;\mathrm{d}t + e^{-\mu t}\;\mathrm{d}P_t \\
& = -\mu P_t e^{-\mu t}\;\mathrm{d}t + e^{-\mu t}(\mu P_t \;\mathrm{d}t + \sigma P_t\;\mathrm{d}W_t) \\
& = \sigma e^{-\mu t} P_t \;\mathrm{d}W_t \\
& = \sigma Y_t \;\mathrm{d}W_t.
\end{align*}
$$
Vimos, anteriormente, que a solução da equação
$$
\mathrm{d}Y_t = \sigma Y_t \;\mathrm{d}W_t
$$
é
$$
Y_t = p_0 e^{-\frac{1}{2}\sigma^2 t + \sigma W_t}.
$$
Assim,
$$
P_t = e^{\mu t}Y_t = p_0 e^{\mu t} e^{-\frac{1}{2}\sigma^2 t + \sigma W_t} = p_0 e^{\left(\mu - \frac{1}{2} \sigma^2\right)t + \sigma W_t}.
$$

## Valor esperado

Vamos, agora, calcular o valor esperado de $P_t$. Para isso, escrevemos a equação integral associada à equação diferencial estocástica:
$$
P_t = p_0 + \mu \int_0^t P_s \;\mathrm{d}s + \sigma \int_0^t P_s\;\mathrm{d}W_s.
$$
Tomando o valor esperado, obtemos
$$
\mathbb{E}\left[P_t\right] = p_0 + \int_0^t \mathbb{E}[P_s]\;\mathrm{d}s.
$$
A solução dessa equação integral é a função exponencial:
$$
\mathbb{E}\left[P_t\right] = p_0e^{\mu t},
$$
que é, também, a solução da equação diferencial ordinária obtida eliminando o ruído da equação estocástica ($\sigma = 0$).
