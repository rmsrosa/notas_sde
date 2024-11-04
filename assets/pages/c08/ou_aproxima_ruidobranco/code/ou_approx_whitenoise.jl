# This file was generated, do not modify it. # hide
#hideall
plts = [plot(abs2.(rfft(ou_t)./n), xlabel="\$k\$", ylabel="\$\\hat y\$", guidefont=10, label="OU τ = $τ spectrum", legend=:topright) for (τ, ou_t) in zip(τs, ous_t)]
plot(plts..., layout=(div(length(plts), 2), 2), size=(900, 600))
savefig(joinpath(@OUTPUT, "ou_approx_whitenoise_spectrum.svg"))