# This file was generated, do not modify it. # hide
#hideall

N = 600
tt = range(t0, tf, length = N)
dt = Float64(tt.step)
νs = (0.1, 1.0, 10.0, 100.0)
Yt = Matrix{Float64}(undef, N, length(νs))
Yt[1, :] .= 1.0
for (j, ν) in enumerate(νs)
    σj = sqrt(2ν)
    for n in 2:N
        local dW = √dt * randn(rng)
        Yt[n, j] = (
            Yt[n-1, j]
            - ν * Yt[n-1, j] * dt
            + σj * dW
        )
    end
end

plot(tt, Yt, xaxis = "\$t\$", yaxis = "\$O_t\$", title = "Ornstein-Uhlenbeck aproximando ruído branco", titlefont = 10, label = permutedims(["ν = $ν" for ν in νs]), legend = :topright, alpha=permutedims([1.0 - j/7 for j in 1:length(νs)]))
savefig(joinpath(@OUTPUT, "ornstein_uhlenbeck_approx_white_noise.svg"))