---
jupyter:
  jupytext:
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.1'
      jupytext_version: 1.2.1
  kernelspec:
    display_name: Julia 1.5.2
    language: julia
    name: julia-1.5
---

# InteractiveUtilsPlus

```julia
if isfile("Project.toml")
    using Pkg
    Pkg.activate(".")
    using Revise
end
```

```julia
using InteractiveUtilsPlus
```

## Basic Examples

```julia
@show_sexpr 2x+1
```

```julia
@show_tree 2x+1
```

```julia
print_tree(AbstractRange)
```

```julia
show_expr(:(f(x, g(y, z))))
```

```julia
@show_expr 2x+1
```

```julia
show_Sexpr(:(f(x, g(y, z))))
```

```julia
@show_Sexpr 2x+1
```

## Miscellaneous Examples

```julia
@show_sexpr for k in 1:10
    x = k*(k+1) ÷ 2
    println("k(k+1)/2 = ", x)
end
```

```julia
@show_sexpr for k in 1:10
    x = k*(k+1) ÷ 2
    println("k(k+1)/2 = ", x)
end true
```

```julia
@show_tree for k in 1:10
    x = k*(k+1) ÷ 2
    println("k(k+1)/2 = ", x)
end 2
```

```julia
@show_tree for k in 1:10
    x = k*(k+1) ÷ 2
    println("k(k+1)/2 = ", x)
end
```

```julia
@show_tree for k in 1:10
    x = k*(k+1) ÷ 2
    println("k(k+1)/2 = ", x)
end 10 true
```

```julia
Meta.@dump for k in 1:10
    x = k*(k+1) ÷ 2
    println("k(k+1)/2 = ", x)
end
```

```julia
@show_expr for k in 1:10
    x = k*(k+1) ÷ 2
    println("k(k+1)/2 = ", x)
end
```

```julia
@show_Sexpr for k in 1:10
    x = k*(k+1) ÷ 2
    println("k(k+1)/2 = ", x)
end
```

```julia
print_tree(Number)
```

```julia
print_tree(AbstractVector)
```

## Documents

```julia
@doc @show_sexpr
```

```julia
@doc @show_tree
```

```julia
@doc print_tree
```

```julia
@doc show_expr
```

```julia
@doc @show_expr
```

```julia
@doc show_Sexpr
```

```julia
@doc @show_Sexpr
```

```julia

```
