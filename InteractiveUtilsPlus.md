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
    display_name: Julia 1.6.0-DEV depwarn -O3
    language: julia
    name: julia-1.6-o3-depwarn
---

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
print_tree(Number)
```

```julia
print_tree(AbstractVector)
```

```julia
?@show_sexpr
```

```julia
?@show_tree
```

```julia
?print_tree
```

```julia

```
