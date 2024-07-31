using Random

rng = Xoshiro(1618)

random(T, m, n) = rand(rng, T, n) .* T(m)

fdc(a,b) = (floor(a/b), ceil(oftype(b,big(a)/big(b)))), fld(a,b), div(a,b), cld(a,b)

#=

julia> fdc(512, Float16(0.75))
((Float16(682.0), Float16(683.0)), Float16(682.0), Float16(682.0), Float16(682.0))

julia> fdc(512.0, Float16(0.75))
((682.0, Float16(683.0)), 682.0, 682.0, 683.0)

julia> fdc(Float16(512.0), Float16(0.75))
((Float16(682.0), Float16(683.0)), Float16(682.0), Float16(682.0), Float16(682.0))

=#


function xsys(::Type{T}, mx, my, n) where {T}
    xs = random(T, mx, n)
    ys = random(T, my, n)
    (xs, ys)
end

function searchxsys(xs, ys, nerrs)
    nflderrs = 0; flderrs = []
    nclderrs = 0; clderrs = []
    for x in xs
        for y in ys
            xoy = Float64(x) / Float64(y)
            xoyT = oftype(x, xoy)
            fldxy = fld(x, y)
            divxy = div(x, y)
            cldxy = cld(x, y)
            if nflderrs < nerrs && fldxy > xoy
               nflderrs += 1
               push!(flderrs, (x, y))
            end
            if nclderrs < nerrs && cldxy < xoy
               nclderrs += 1
               push!(clderrs, (x, y))
            end
        end
    end
    (; flderrs, clderrs)
end
    
  
