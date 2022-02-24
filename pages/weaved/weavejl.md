@def title = "Weaved Julia Script"

# {{ get_title }}



This page was generated from a **julia script**, automatically converted to markdown with [Weave.jl](https://github.com/JunoLab/Weave.jl). The conversion happens automatically when the menu is constructed.



## Julia Dots



PNG with path relative to site, i.e. `/assets/images/julia-logo-dots-small.png`:



![Julia dots](/assets/images/julia-logo-dots-small.png)



## Julia Speeder



GIF with path relative to file but within `_assets/`, i.e. `../_assets/images/juliaspeeder32x32.gif`, and postprocessed accordingly, so it works both in Franklin and in Weave:



![Julia speeder](/assets/images/juliaspeeder32x32.gif)



## Math



$$
\exp(i\pi) + 1 = 0
$$



## Code chunks



Here is a julia chunk:

```julia
x = 1
```

```
1
```




and another:

```julia
println("hello world!")
```

```
hello world!
```




## Plot

```julia
using Plots

x = 0.0:0.01:2π
y = sin.(2x) + sin.(5x)

plot(x, y)
```

\fig{images/weavejl_2_1.png}
