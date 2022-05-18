@def title = "Desigualdades"

# {{ get_title }}

Vejamos algumas desigualdades que nos serão úteis.

## Desigualdade de Markov

$$
\mathbb{P}(|X| > r) \leq \frac{\mathbb{E}[|X|]}{r}, \quad \forall r > 0.
$$

## Desigualdade de Chebyshev

$$
\mathbb{P}(|X - \mathbb{E}[X]| \geq r) \leq \frac{\mathrm{Var}(X)}{r^2}, \quad \forall r > 0.
$$

## Desigualdade de Lyapunov

$$
\mathbb{E}[X] \leq \sqrt{\mathbb{E}[X^2]}.
$$

## Estimativas para eventos conjuntos

Considere dois eventos $A$ e $B$. Se eles forem independentes, temos $\mathbb{P}(A \cap B) = \mathbb{P}(A)\mathbb{P}(B)$.

No casos deles serem dependentes e *mutuamente exclusivos*, i.e. $A \cap B = \emptyset$, então $\mathbb{P}(A \cap B) = 0$.

Caso $A \subset B$ (ou $B \subset A$), então $\mathbb{P}(A \cap B) = \mathbb{P}(A)$ (resp. $\mathbb{P}(A \cap B) = \mathbb{P}(B)$).

Caso não tenhamos mais informações sobre $A$ e $B$, podemos, pelo menos, obter certas estimativas. Por exemplo,  como $A \cap B \subset A$ e $A \cap B \subset B$, temos,
$$
\mathbb{P}(A \cap B) \leq \mathbb{P}(B)
$$
e
$$
\mathbb{P}(A \cap B) \leq \mathbb{P}(A).
$$
Ou seja,
$$
\mathbb{P}(A \cap B) \leq \min\left\{\mathbb{P}(A), \mathbb{P}(B)\right\}.
$$