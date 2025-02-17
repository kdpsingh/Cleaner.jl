# Cleaner

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://TheRoniOne.github.io/Cleaner.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://TheRoniOne.github.io/Cleaner.jl/dev)
[![Build Status](https://github.com/TheRoniOne/Cleaner.jl/workflows/CI/badge.svg)](https://github.com/TheRoniOne/Cleaner.jl/actions)
[![Coverage](https://codecov.io/gh/TheRoniOne/Cleaner.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/TheRoniOne/Cleaner.jl)
### A toolbox of simple solutions for common data cleaning problems.

**Compatible with any [Tables.jl](https://github.com/JuliaData/Tables.jl) implementation.**

**Installation**: At the Julia REPL, `using Pkg; Pkg.add("Cleaner")`

## Key Features

### With Cleaner.jl you will be able to:

- Format column names to make them unique and fit `snake_case` or `camelCase` style.
- Remove rows and columns filled with different kinds of empty values.
e.g: `missing`, `""`, `"NA"`, `"None"`
- Delete columns filled with just a constant value.
- Delete rows with at least one missing value.
- Use a row as the names of the columns.
- Minimize the amount of element types for each column without making the column of type `Any`.
- Add a row index to your table.
- Automatically use multiple threads if your data is big enough (and you are running `Julia` with more than 1 thread).
- Rematerialize your original source [Tables.jl](https://github.com/JuliaData/Tables.jl) type, as `CleanTable` implements the [Tables.jl](https://github.com/JuliaData/Tables.jl) interface too.
- Apply `Cleaner` transformations on your original table implementation and have the resulting table be of the same type as the original.
- Get all repeated values or value combinations that are supposed to be unique.
- Get the percentage distribution of the different categories that make up your table.
- Compare tables to help solve `join` or `merge` problems caused by having different schemas.

### To keep in mind

- All non mutating functions (those ending without a `!`) recieve a `table` as argument and return a `CleanTable`.
- All mutating functions (those ending with a `!`) recieve a `CleanTable` and return a `CleanTable`.
- All returning original type function variants (those ending with ROT) recieve a `table` as argument and return a `table` of the same type of the original.

So you can start your workflow with a non mutating function and continue it using mutating ones if you prefer.
E.g.

```julia
julia> df = DataFrame(" some bad Name" => [missing, missing, missing], "Another_weird name " => [1, 2, 3])
3×2 DataFrame
 Row │  some bad Name  Another_weird name
     │ Missing         Int64
─────┼─────────────────────────────────────
   1 │        missing                    1
   2 │        missing                    2
   3 │        missing                    3

julia> df |> polish_names |> compact_columns!
┌────────────────────┐
│ another_weird_name │
│              Int64 │
├────────────────────┤
│                  1 │
│                  2 │
│                  3 │
└────────────────────┘


```

## Related Packages

- [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl) for general and complex tabular data transformations.
- [TableOperations.jl](https://github.com/JuliaData/TableOperations.jl) for common lazily evaluated transformations on [Tables.jl](https://github.com/JuliaData/Tables.jl) implementations.
- [FeatureTransforms.jl](https://github.com/invenia/FeatureTransforms.jl), [TableTransforms.jl](https://github.com/JuliaML/TableTransforms.jl) for statistical data transformations on [Tables.jl](https://github.com/JuliaData/Tables.jl) implementations.

## Acknowledgement

Inspired by [janitor](https://github.com/sfirke/janitor) from the R ecosystem.
