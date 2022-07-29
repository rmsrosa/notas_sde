# This file was generated, do not modify it. # hide
function fsir(u, p, t)
    β, γ = p
    s, i = u
    du = [-β * s * i, β * s * i - γ * i]
    return du
end

function fsir1!(du, u, p, t) # does not work as desired
    β, γ = p
    s, i = u
    du = [-β * s * i, β * s * i - γ * i]
    return du
end

function fsir2!(du, u, p, t)
    β, γ = p
    s, i = u
    du .= [-β * s * i, β * s * i - γ * i]
    return du
end

function fsir3!(du, u, p, t)
    β, γ = p
    s, i = u
    inew = -β * s * i
    rnew = γ * i
    du[1] = -inew
    du[2] = inew - rnew
    return du
end