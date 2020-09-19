module InteractiveUtilsPlus

export @show_sexpr, @show_tree, print_tree

using InteractiveUtils: subtypes
using AbstractTrees

"""
    @show_sexpr(expr, linenums=false)

shows the lisp style S-expression of `expr` and prints the line number nodes if `linenums` is true.

## Example

```julia
julia> @show_sexpr 2x+1
(:call, :+, (:call, :*, 2, :x), 1)
```
"""
macro show_sexpr(expr, linenums=false)
    linenums || Base.remove_linenums!(expr)
    :(Meta.show_sexpr($(QuoteNode(expr))))
end

AbstractTrees.printnode(io::IO, expr::Expr) = show(io, expr.head)

"""
    @show_tree(expr, maxdepth=10, linenums=false)

shows the tree form of the expression `expr` with maxdepth and prints the line number nodes if `linenums` is true.

## Example
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
"""
macro show_tree(expr, maxdepth=10, linenums=false)
    linenums || Base.remove_linenums!(expr)
    :(print_tree($(QuoteNode(expr)), $(esc(maxdepth))))
end

AbstractTrees.children(T::Type) = subtypes(T)

"""
    print_tree(T::Type, maxdepth=5; kwargs...)

prints the subtree of the type `T`.

## Example
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
"""
print_tree

end
