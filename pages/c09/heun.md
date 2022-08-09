@def title = "Método de Heun"

# {{ get_title }}

Este método melhora a ordem de convergência para $p = 2$, no caso determinístico e aleatório (veja Neckel & Rupp (2013), Seções 7.3.2 e 7.3.4), desde que as soluções sejam suaves. Quando a solução não tem regularidade suficiente, a ordem de convergência é menor, como veremos a seguir. No caso estocástico, porém, o método não converge (veja Higham & Kloeden (2021), Seção 17.3). 
