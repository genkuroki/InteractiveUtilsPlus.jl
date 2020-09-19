using InteractiveUtilsPlus
using Documenter

makedocs(;
    modules=[InteractiveUtilsPlus],
    authors="genkuroki <genkuroki@gmail.com> and contributors",
    repo="https://github.com/genkuroki/InteractiveUtilsPlus.jl/blob/{commit}{path}#L{line}",
    sitename="InteractiveUtilsPlus.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://genkuroki.github.io/InteractiveUtilsPlus.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/genkuroki/InteractiveUtilsPlus.jl",
)
