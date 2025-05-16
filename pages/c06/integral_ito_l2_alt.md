@def title = "Aproximação de processos de quadrado integrável por processos contínuos quase certamente"

# {{ get_title }}

Uma alternativa ao caminho clássico de aproximação por processos do tipo escada, podemos estender a integral estocástica
$$
\int_0^T H_t \;\mathrm{d}W_t
$$
a processos $\{H_t\}_{t\geq 0}$ adaptados a $\{W_t\}_{t\geq 0}$ que sejam progressivamente mensuráveis e de quadrado integrável usando a construção que fizemos para funções uniformemente contínuas em $L^2.$

## Construção

No caso de $\{H_t\}_{t\geq 0}$ ser progressivamente mensurável e de quadrado integrável, a ideia é aproximar o processo por processos $\{H_t^m\}_{t \geq 0}$ adaptados e que sejam contínuos em $L^2.$ Essa aproximação é diretamente obtida da convolução.

### Aproximação por processos contínuos em média quadrática

Dada uma função de quadrado integrável $f:\mathbb{R} \rightarrow \mathbb{R},$ uma maneira clássica de aproximá-la por funções contínuas é através da convolução $t \mapsto \int_\mathbb{R} f(s) \varphi_\varepsilon(t-s) \;\mathrm{d}t$ com aproximações da identidade $\varphi_\varepsilon.$ Essa convolução, no entanto, envolve, tipicamente, olhar para o "passado" e para o "futuro" da função. O mesmo acontece com processos. No entanto, para a integral de Itô, queremos preservar a propriedade de não antecipação do processo. Para isso, usamos aproximações da identidade que considerem apenas o passado da função, por exemplo,
$$
\varphi_\varepsilon(t) = \begin{cases}
\displaystyle \frac{1}{\varepsilon} e^{-t/\varepsilon}, & t \geq 0, \\
0, & t < 0.
\end{cases}
$$

```julia:aprox_id_exp
#hideall
using Plots
theme(:ggplot2)
N = 3
tt = -4:0.01:4
xx = [
    m * ifelse.(tt .≥  0, exp.( -m * tt), 0) for m in 1:N
]
plot(tt, xx, title = "aproximações da identidade \$t \\rightarrow m e^{m t}\$", titlefont = 10, xaxis = "\$t\$", yaxis = "\$x\$", label=reshape("m = " .* string.(1:N), 1, :))
savefig(joinpath(@OUTPUT, "aprox_id_exp.svg"))
```
\fig{aprox_id_exp}

Mais especificamente, dado um processo $\{H_t\}_{t \geq 0}$ de quadrado integrável e progressivamente mensurável em relação a $\{W_t\}_{t \geq 0},$ estendemos $H_t = 0,$ para $t \leq 0$ e definimos
$$
H_t^m = \varphi_{1/m} \star H_t = \int_0^t m e^{-m(t - s)} H_s \;\mathrm{d}s.
$$
Como $H_t^m$ só envolve $H_s,$ para $0\leq s \leq t,$ então $H_t^m$ continua sendo não antecipativo. Além disso, para $t \geq 0$ e $\tau > 0,$
$$
\begin{align*}
H_{t+\tau}^m - H_t^m & = \int_0^{t+\tau} m e^{-m(t + \tau - s)} H_s \;\mathrm{d}s - \int_0^t m e^{-m(t - s)} H_s \;\mathrm{d}s \\
& = \int_t^{t+\tau} m e^{-m(t + \tau - s)} H_s \;\mathrm{d}s + \int_0^t m \left(e^{-m(t + \tau - s)} - e^{-m(t - s)}\right) H_s \;\mathrm{d}s
\end{align*}
$$

Usando que $e^{-m(t + \tau - s)} \leq 1$ e
$$
\left|e^{-m(t + \tau - s)} - e^{-m(t - s)}\right| = \int_{t - s}^{t + \tau - s} m e^{-m\eta}\;\mathrm{d}\eta \leq m \tau,
$$
obtemos
$$
\begin{align*}
\left|H_{t+\tau}^m - H_t^m \right| & \leq \int_t^{t+\tau} m |H_s| \;\mathrm{d}s - \int_0^t m^2 \tau |H_s| \;\mathrm{d}s \\
& \leq m \sqrt{\tau} \left(\int_t^{t+\tau} H_s^2 \;\mathrm{d}s\right)^{1/2} + m^2 \tau \sqrt{t}\left(\int_0^t H_s^2 \;\mathrm{d}s\right)^{1/2} \\
& \leq m \sqrt{\tau}\max\{1, m\sqrt{\tau t}\}\left(\int_0^{t+\tau} H_s^2 \;\mathrm{d}s\right)^{1/2}.
\end{align*}
$$

Para $0 \leq \tau < t,$ obtemos, analogamente, a mesma estimativa.

Como $\{H_t\}_{t\geq 0}$ é de quadrado integrável em intervalos finitos, segue que, para quase todo caminho amostral,
$$
\int_0^{t+\tau} H_s(\omega)^2 \;\mathrm{d}s < \infty,
$$
de modo que
$$
H_{t + \tau}^m(\omega) \rightarrow H_t^m(\omega), \quad \tau \rightarrow 0,
$$
mostrando a continuidade quase certamente das aproximações $\{H_t^m\}_{t \geq 0}.$ Também podemos mostrar a continuidade em média quadrática, ou seja
$$
\mathbb{E}\left[\left(H_{t+\tau}^m - H_t^m \right)^2\right] \leq m^2 \tau\max\{1, m^2\tau t\}\left(\int_0^{t+\tau} \mathbb{E}[H_s^2] \;\mathrm{d}s\right) \rightarrow 0,
$$
quando $\tau \rightarrow 0,$ visto que $\{H_t\}_{t\geq 0}$ é de quadrado integrável.

### Convergência da aproximação

Um outro passo fundamental é mostrar que, de fato, $\{H_t^m\}_{t\geq 0}$ converge para $\{H_t\}_{t\geq 0},$ em média quadrática. Isso é feito da seguinte forma. Primeiro, escrevemos
$$
\begin{align*}
H_t - H_t^m & = H_t - \int_0^\infty m e^{-m s} H_{t - s}\;\mathrm{d}s \\
  & = H_t \int_0^\infty m e^{-m s} \;\mathrm{d}s - \int_0^\infty m e^{-m s} H_{t - s}\;\mathrm{d}s \\
  & = \int_0^\infty m e^{-m s} (H_t - H_{t - s})\;\mathrm{d}s.
\end{align*}
$$
Com isso, usando a desigualdade de Cauchy-Schwarz, quebrando o termo da exponencial em $e^{-m s} = e^{-m s/2}e^{-m s/2},$
$$
\begin{align*}
|H_t - H_t^m|^2 & = \left(\int_0^\infty m e^{-m s} (H_t - H_{t - s})\;\mathrm{d}s\right)^2 \\
  & \leq \left(\int_0^\infty m e^{-m s} (H_t - H_{t - s})^2\;\mathrm{d}s\right)\left(\int_0^\infty m e^{-m s} \;\mathrm{d}s\right) \\
  & = \int_0^\infty m e^{-m s} (H_t - H_{t - s})^2\;\mathrm{d}s.
\end{align*}
$$
Fazendo uma mudança de variáveis, obtemos
$$
|H_t - H_t^m|^2 \leq \int_0^\infty e^{-s} (H_t - H_{t - s/m})^2\;\mathrm{d}s.
$$
Assim,
$$
\begin{align*}
    \int_0^T \mathbb{E}\left[\left|H_t - H_t^m\right|^2\right] \;\mathrm{d}t \leq \int_0^T \int_0^\infty e^{-s} \mathbb{E}\left[(H_t - H_{t - s/m})^2\right]\;\mathrm{d}s\;\mathrm{d}t
\end{align*}
$$
Trocando a ordem de integração e usando a continuidade em média quadrática de processos com média quadrática, obtemos a convergência. Ops.

### Integral de Itô do processo de Wiener

Como o processo de Wiener tem caminhos quase certamente contínuos, vale o limite
$$
    \int_0^T W_t \;\mathrm{d}W_t = \lim \sum_{j=1}^n W_{t_{j-1}^n}(W_{t_j^n} - W_{t_{j-1}^n}),
$$
em média quadrática. Por outro lado, já calculamos que o limite do lado direito acima é $W_T/2 - T/2.$ Portanto, vale, de fato, para a integral de Itô, que
$$
    \int_0^T W_t \;\mathrm{d}W_t = \frac{W_T}{2} - \frac{T}{2}.
$$
