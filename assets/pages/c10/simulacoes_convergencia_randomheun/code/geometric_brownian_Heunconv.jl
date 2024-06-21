# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

let μ = 2.0; t0 = 0.0; tf = 2.0; x0 = 1.0; Nmax = 1_024; M = 10

    f(x, μ, t, y) = - μ * (1.0 + y) * x

    # Finest mesh
    ttfine = range(t0, tf, length = Nmax+1)

    for (nfig, θnum) in enumerate((6, 3, 2, 1)) ## force θ to be θnum / 3

        nsteps = (2^n for n in 4:-1:1)
        Ns = (div(Nmax, nstep) for nstep in nsteps)

        ## Yt = Matrix{Float64}(undef, Nmax+1, M)
        angfreqs = 2π * rand(M)
        Yt = (cbrt.(sin.(ttfine * angfreqs')) .^ θnum) .* cos.(ttfine * angfreqs')

        ## solução construída com a malha mais fina
        St = x0 * exp.(- μ * (ttfine .+ (3/(θnum+3)) * (cbrt.(sin.(ttfine * angfreqs')) .^ (θnum+3)) ./ angfreqs'))

        errosEM = Vector{Float64}(undef, length(Ns))
        erros = Vector{Float64}(undef, length(Ns))
        deltas = Vector{Float64}(undef, length(Ns))

        for (i, (nstep, N)) in enumerate(zip(nsteps, Ns))
            local tt = range(t0, tf, length=N+1)
            local dt = Float64(tt.step)
            deltas[i] = dt

            local XEMt = Matrix{Float64}(undef, N+1, M)
            XEMt[1, :] .= x0
            
            local Xt = Matrix{Float64}(undef, N+1, M)
            Xt[1, :] .= x0

            local fn = zeros(M)
            tn1 = t0
            tn = t0 + dt
            for m in 1:M
                for n in 2:N+1
                    # Euler
                    fn = f(XEMt[n-1, m], μ, tn1, Yt[1 + nstep * (n - 2), m])
                    XEMt[n, m] = XEMt[n-1, m] .+ fn * dt

                    # Heun
                    an = f(Xt[n-1, m], μ, tn1, Yt[1 + nstep * (n - 2), m])
                    xn = Xt[n-1, m] + dt * an
                    bn = f(xn, μ, tn, Yt[1 + nstep * (n - 1), m])
                    Xt[n, m] = Xt[n-1, m] + dt * (an + bn) / 2
                end
            end

            errosEM[i] = maximum(sum(abs, XEMt .- St[1:nstep:end, :], dims = 2)) / M
            erros[i] = maximum(sum(abs, Xt .- St[1:nstep:end, :], dims = 2)) / M
            
        end

        lcEM, pEM = [one.(deltas) log.(deltas)] \ log.(errosEM)
        linear_fit_EM = exp(lcEM) * deltas .^ pEM

        lc, p = [one.(deltas[1:end-1]) log.(deltas[1:end-1])] \ log.(erros[1:end-1])
        linear_fit = exp(lc) * deltas .^ p

        plot(xscale = :log10, yscale = :log10, xaxis = "Δt", ylims = [0.1, 10.0] .* extrema(errosEM), yaxis = "erro", title = "Erro forte EM p = $(round(pEM, digits=2))\nX₀ = $x0, μ = $μ, θ = $θnum/3, T = $tf, M = $M", titlefont = 12, legend = :topleft)
        scatter!(deltas, errosEM, marker = :star, label = "erro forte $M amostras")
        plot!(deltas, linear_fit_EM, linestyle = :dash, label = "ajuste linear")
        savefig(joinpath(@OUTPUT, "rode_EMconvfig$nfig.svg"))

        plot(xscale = :log10, yscale = :log10, xaxis = "Δt", ylims = [0.1, 10.0] .* extrema(erros), yaxis = "erro", title = "Erro forte Heun p = $(round(p, digits=2))\nX₀ = $x0, μ = $μ, θ = $θnum/3, T = $tf, M = $M", titlefont = 12, legend = :topleft)
        scatter!(deltas, erros, marker = :star, label = "erro forte $M amostras")
        plot!(deltas, linear_fit, linestyle = :dash, label = "ajuste linear")
        savefig(joinpath(@OUTPUT, "rode_Heunconvfig$nfig.svg"))
    end
end