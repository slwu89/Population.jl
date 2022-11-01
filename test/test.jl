# struct test1{T}
#     mysize::T
# end

# x = test1(5)

# isbits(x)

# struct test2{T}
#     mysize::T
#     f::Function
# end

# x = test2(5, (x) -> x+1)

# x.f(1)
# isbits(x)

# struct test3{T,F<:Function}
#     mysize::T
#     f::F
# end

# y = test3(5, (x) -> x+1)

# y.f(1)
# isbits(y)

abstract type overtype_simple end

struct type1_simple <: overtype_simple
    step::Float64
end

struct type2_simple <: overtype_simple
    step::Int64
end

function testfn(x::overtype_simple...)
    typeof(x), length(x)
end

testfn(type1_simple(5.0),type2_simple(5), type1_simple(10.0))



abstract type overtype{T} end

struct type1{Float64} <: overtype{Float64}
    step::Float64
end

struct type2{Int64} <: overtype{Int64}
    step::Int64
end

function testfn1(x::overtype...)
    typeof(x), length(x)
end

testfn1(type1(5.0),type2(5), type1(10.0))
testfn1(type1(5.0))

function testfn2(x::overtype...) 
    # tuple([typeof(xx.step) for xx in x]...)
    typeof(tuple([xx.step for xx in x]...))
    # tuple([Core.Typeof(xx.step) for xx in x]...)
end

testfn2(type1(5.0),type2(5), type1(10.0))


struct data1{T}
    key::T
end

function data1(x::overtype...)
    keytype = ([typeof(xx.step) for xx in x]...,)
    data1{typeof(keytype)}(keytype), typeof(keytype)
end

data1(type1(5.0),type2(5), type1(10.0))

typeof(y)

Tuple{Int64}(1)