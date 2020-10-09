module InteractiveUtilsPlus

export @show_sexpr, @show_tree, print_tree, show_expr, @show_expr, show_Sexpr, @show_Sexpr

using InteractiveUtils: subtypes
using AbstractTrees

"""
    @show_sexpr(expr, linenums=false)

shows the lisp style S-expression of `expr` and prints the line number nodes if `linenums` is true.

## Example

```jldoctest
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
```jldoctest
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
```jldoctest
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

"""
    show_expr([io::IO,], ex)

shows expression `ex` as a Julia style expression.

# Examples
```jldoctest
julia> show_expr(:(f(x, g(y, z))))
Expr(:call, :f, :x, 
    Expr(:call, :g, :y, :z))
```
"""
show_expr(ex; indent=expr_indent, head="Expr") =
    show_expr(stdout, ex; indent, head)
show_expr(io::IO, ex; indent=expr_indent, head="Expr") =
    show_expr(io, ex, 0; indent, head)
show_expr(io::IO, ex, inner; indent=expr_indent, head="Expr") =
    show(io, ex)

const expr_indent = 4

function show_expr(io::IO, ex::QuoteNode, inner; indent=expr_indent, head="Expr")
    print(io, "(:quote, ")
    show_expr(io, ex.value, inner+indent; indent)
    print(io, ')')
end
function show_expr(io::IO, ex::Expr, inner; indent=expr_indent, head="Expr")
    print(io, (iszero(inner) ? "" : "\n"), " "^inner, "$head(")
    show_expr(io, ex.head, inner+indent; indent, head)
    for arg in ex.args
        print(io, ", ")
        show_expr(io, arg, inner+indent; indent, head)
    end
    if isempty(ex.args)
        print(io, ",)")
    else
        print(io, ')')
    end
end

"""
    @show_expr(expr, linenums=false)

shows the Juia style expression of `expr` and prints the line number nodes if `linenums` is true.

## Example

```jldoctest
julia> @show_expr 2x+1
Expr(:call, :+, 
    Expr(:call, :*, 2, :x), 1)
```
"""
macro show_expr(expr, linenums=false)
    linenums || Base.remove_linenums!(expr)
    :(show_expr($(QuoteNode(expr))))
end

"""
    show_Sexpr([io::IO,], ex)

Show expression `ex` as a lisp style expression.

Remark: The indentation is different from `@show_sexpr`.

# Examples
```jldoctest
julia> show_Sexpr(:(f(x, g(y, z))))
Expr(:call, :f, :x, 
    Expr(:call, :g, :y, :z))
```
"""
show_Sexpr(io::IO, ex; indent=expr_indent) = show_expr(io, ex; indent, head="")
show_Sexpr(ex; indent=expr_indent) = show_Sexpr(stdout, ex; indent)

"""
    @show_Sexpr(expr, linenums=false)

shows the lisp style S-expression of `expr` and prints the line number nodes if `linenums` is true.

Remark: The indentation is different from `@show_sexpr`.

## Example

```jldoctest
julia> @show_Sexpr 2x+1
(:call, :+, 
    (:call, :*, 2, :x), 1)
```
"""
macro show_Sexpr(expr, linenums=false)
    linenums || Base.remove_linenums!(expr)
    :(show_Sexpr($(QuoteNode(expr))))
end

end
