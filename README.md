# Deprecated

[MetaUtils.jl](https://github.com/genkuroki/MetaUtils.jl) is the renamed and enhanced version of this package.

# InteractiveUtilsPlus

<!--
[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://genkuroki.github.io/InteractiveUtilsPlus.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://genkuroki.github.io/InteractiveUtilsPlus.jl/dev)
[![Build Status](https://travis-ci.com/genkuroki/InteractiveUtilsPlus.jl.svg?branch=master)](https://travis-ci.com/genkuroki/InteractiveUtilsPlus.jl)
-->

This package provides the utilities not found in InteractiveUtils and Meta modules.

## Installation

```julia
julia> ]
pkg> add https://github.com/genkuroki/InteractiveUtilsPlus.jl
```

## Examples

```julia
julia> @show_sexpr 2x+1
(:call, :+, (:call, :*, 2, :x), 1)
```

```julia
julia> @show_tree 2x+1
:call
├─ :+
├─ :call
│  ├─ :*
│  ├─ 2
│  └─ :x
└─ 1
```

```julia
julia> print_tree(AbstractRange)
AbstractRange
├─ LinRange
├─ OrdinalRange
│  ├─ AbstractUnitRange
│  │  ├─ IdentityUnitRange
│  │  ├─ OneTo
│  │  ├─ Slice
│  │  └─ UnitRange
│  └─ StepRange
└─ StepRangeLen
```

```julia
julia> show_expr(:(f(x, g(y, z))))
Expr(:call, :f, :x, 
    Expr(:call, :g, :y, :z))
```

```julia
julia> @show_expr 2x+1
Expr(:call, :+, 
    Expr(:call, :*, 2, :x), 1)
```

```julia
julia> show_Sexpr(:(f(x, g(y, z))))
Expr(:call, :f, :x, 
    Expr(:call, :g, :y, :z))
```

```julia
julia> @show_Sexpr 2x+1
(:call, :+, 
    (:call, :*, 2, :x), 1)
```
