using Test
using Cleaner: CleanTable, row_as_names, reinfer_schema, names, size

@testset "row_as_names is working as expected" begin
    testCT = CleanTable([:A, :B, :C], [[1, 2, "x", 4], [5, 6, "y", 7], ["x", "y", "z", "a"]])

    @test names(row_as_names(testCT, 3)) == Symbol[:x, :y, :z]
    @test size(row_as_names(testCT, 3)) == (1, 3)
    
end
