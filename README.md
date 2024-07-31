# FixingDivs.jl
## investigating errors in the implementation of `fld, div, cld` and their solution
### Jeffrey Sarnoff 2024-08-29

#### relevant issue
- [Incorrect results from floating-point division (fld, cld, div)](https://github.com/JuliaLang/julia/issues/49450)
#### relevant pull requests
- [fix floating-point div](https://github.com/JuliaLang/julia/pull/49561)
- [Improve floating-point Euclidean division for Float16 and Float32](https://github.com/JuliaLang/julia/pull/49637)

## annotated directory
`test/finderrors.jl`: random search for 16 errors in Float16, Float32, Float64
