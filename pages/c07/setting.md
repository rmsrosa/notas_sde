@def title = "Interpretação da equação"

# {{ get_title }}

Neste capítulo, vamos considerar equações diferenciais estocásticas da forma
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
onde $T > 0$, $\{W_t\}_{t\geq 0}$ é um processo de Wiener e $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$.

Junte-se à essa equação uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0,
$$
onde $X_0$ é uma variável aleatória real.

## Significado da equação

Os termos $\mathrm{d}X_t$ e $\mathrm{d}W_t$ não têm significado por si só. A equação conforme escrita acima é uma maneira de se escrever a equação integral correspondente:
$$
X_t = X_0 + \int_0^t f(s, X_s)\mathrm{d}s + \int_0^t g(s, X_s)\mathrm{d}W_s.
$$
Sob condições apropriadas em $f$, $g$ e na solução $X_t$, a primeira integral é uma integral de Riemann ou de Lebesgue de um processo definido por $H_t = f(t, X_t)$ e a segunda integral é uma integral de Itô de um processo definido por $G_t = g(t, X_t)$, em relação ao processo $\{W_t\}_{t\geq 0}$. Buscamos condições que garantam a existência de um processo apropriado $\{X_t\}_{t \geq 0}$ que satisfaça essa equação integral.

## Nomenclatura

O termo $f = f(t, x)$ é chamado de *drift* e $g = g(t, x)$, de *difusão.*

Uma notação comum é escrevê-los como $\mu$ e $\sigma$. Para ver a razão disso, considere o caso com coeficientes determinísticos e condição inicial nula:
$$
\mathrm{d}X_t = \mu(t)\mathrm{d}t + \sigma(t)\mathrm{d}W_t, \quad \left. X_t \right|_{t = 0} = 0.
$$
Essa equação é pra ser interpretada como a equação integral
$$
X_t = \int_0^t \mu(s)\mathrm{d}s + \int_0^t \sigma(s)\mathrm{d}W_s.
$$

Já vimos que
$$
\mathbb{E}\left[\int_0^t \sigma(s)\mathrm{d}W_s\right] = 0.
$$
Assim, o valor esperado da solução é
$$
\mathbb{E}[X_t] = \int_0^t \mu(s)\mathrm{d}s.
$$
Por sua vez, a variância é dada por
$$
\mathrm{Var}(X_t) = \mathbb{E}[(X_t - \mathbb{E}[X_t])^2] = \mathbb{E}\left[\left(\int_0^t \sigma(s)\mathrm{d}W_s\right)^2\right].
$$
Usando a isometria de Itô e o fato de $\sigma$ ser determinístico, isso nos dá
$$
\mathrm{Var}(X_t) = \int_0^t \sigma(s)^2\mathrm{d}W_s.
$$

Dessa forma, associamos $\mu$ e $\sigma$ diretamente ao valor esperado e ao desvio padrão, respectivamente, da solução $\{X_t\}_{t \geq 0}$ da equação.
