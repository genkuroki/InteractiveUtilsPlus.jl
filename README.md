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
