### A Pluto.jl notebook ###
# v0.11.6

using Markdown
using InteractiveUtils

# ╔═╡ 2a836ea0-e13e-11ea-0788-791c7f9a3555
md"### from UPENN Julia manual:
<https://www.sas.upenn.edu/~jesusfv/Chapter_HPC_8_Julia.pdf>

#Julia has strong typing, and allows users not to define the type, guessing type"



# ╔═╡ 6d177fe0-e13e-11ea-0ffb-4f227e4a677f
md"All predefined types are ordered in a tree that starts with 'any'.
Subtypes such as string, number, etc. are predefined. Examples below. "

# ╔═╡ 6568fd1e-e164-11ea-3dce-41f42a669860
subtypes(Any)

# ╔═╡ 68482840-e164-11ea-2d89-a55141ab0450
subtypes(Number)

# ╔═╡ 6fd487c0-e164-11ea-1567-43851926625b
subtypes(Real)

# ╔═╡ 91626c70-e13e-11ea-0eb2-5b3098ff5895
md"This type tree can integrate and handle user-defined types (i.e., types with properties
defined by the programmer) as fast and compactly as built-in types. In Julia, this userdefined types are called composite types. A composite type is the equivalent in Julia to structs and objects in C/C++, Python, Matlab, and R, although they do not incorporate methods, functions do. If these two last sentences look obscure to you: do not worry! You are not missing anything of importance right now. We will delay a more detailed discussion of composite types until Section 1.8 and then you will be able to follow the argument much better."

# ╔═╡ 35c566d0-e164-11ea-1a1c-05b982890ce5
md""" ## Duck types
Julia is strongly typed, but you need not worry too much about it until you want to optimize code. Generally, type is inferred, and can be explicitely specified. 
All Types are subtypes of "Any" """

# ╔═╡ bb78a790-e13e-11ea-2dd6-6ff0f7943390

"You can always check the type of a variable with typeof"

# ╔═╡ 9307a612-e140-11ea-04bf-51237db18b39
md"Later, when we learn about iterated collections, you might find useful to check their type with:"

# ╔═╡ 96424230-e141-11ea-32e6-9dd64a44c8f0
 #determine type of elements in collection a
eltype([1,2.3])

# ╔═╡ f697ee10-e140-11ea-25d3-790d2966953d
a=.1

# ╔═╡ 01f73770-e155-11ea-300c-21ad8eefbf88
typeof(a)

# ╔═╡ ec4394f0-e140-11ea-3d5c-4d956b99c6d2
typeof(a)

# ╔═╡ 9d36c3f0-e140-11ea-02ef-0d8858fac919
md"To check the whole variable space, use varinfo:"

# ╔═╡ bb99b230-e140-11ea-2b29-21e1e86db5b9
varinfo()

# ╔═╡ 349eaf00-e141-11ea-1d2f-03d5a65e7e2b
#In comparision with Matlab, Julia does not have a command to clear the workspace. You
#can always liberate memory by equating a large object to zero. (in Pluto, obviously,you have to go back to the original cell in which you defined the object.)
#or by running the garbage collector
#GC.gc() # garbage collector

# ╔═╡ 85f80810-e141-11ea-3b43-ed68f8185f34
md"""Be careful though! Only run the garbage collector if you understand what a garbage collector is. Chances are you will never need to do so."""

# ╔═╡ c3d10240-e141-11ea-267c-a756a6eb98bd
md"""### unicode variables
Julia’s sophisticated type structure provides you with extraordinary capabilities. For
instance, you can use a greek letter as a variable by typing its LATEX’s name plus pressing

\alpha (+ press Tab)

This α is a variable that can operated upon like any other regular variable in Julia, i.e.,
we can sum to another variable, divide it, etc. This is particularly useful when coding
mathematical functions with parameters expressed in terms of greek letters, as we usually do
in economics. The code will be much easier to read and maintain.
You can extend this capability of to all Unicode characters and operate on exotic variables

Create a variable called aleph with value 3"""

# ╔═╡ 069dafb0-e142-11ea-264f-db24f8b2550f
α = 3

# ╔═╡ 61dc2552-e142-11ea-214d-9fdfa45fbce7
md"Create a phone with value 0496172933 by typing \:phone: (+ press Tab) = 0496172933"


# ╔═╡ 773ed8c0-e142-11ea-23e1-1d4f359277b9
☎ = 0496172933

# ╔═╡ 9272ce30-e142-11ea-2c90-212e2539f538
md"a whale:"

# ╔═╡ d684a5ce-e142-11ea-0975-a960347b560d
🐳 = 12000

# ╔═╡ e512ff20-e142-11ea-10db-7f8e19c07ebe
md"Sum both \aleph (+ press Tab) + \:whale: (+ press Tab)"

# ╔═╡ b8298520-e155-11ea-2ac4-ff963d8af262
#if you define Aleph afterwards, it works: 
ℵ=3

# ╔═╡ f7ebd360-e142-11ea-08cf-99a7b24d5db1
ℵ + 🐳

# ╔═╡ 00abd0e0-e143-11ea-34dd-df017f6b71bf
α+🐳

# ╔═╡ 807681d0-e143-11ea-1487-d797128c5fd5
md"""In addition, and quite unique among programming languages, Julia has an irrational
type, with variables such as π = 3.1415... or e = 2.7182... already predefined
- \pi (+ press Tab) # returns 3.14...
- \euler (+ press Tab) # returns 2.72..."""


# ╔═╡ 6064ab0e-e143-11ea-243c-7fed812f1ed2
typeof(π)

# ╔═╡ d30f1e60-e153-11ea-17d8-f17d6d421fa1
subtypes(AbstractIrrational)

# ╔═╡ 3dc9f6ce-e154-11ea-1fb8-c35cf5580682
begin
	a1= 2//3
	typeof(a1) # type of a
end

# ╔═╡ 656d45e0-e143-11ea-318f-8560882b3088
md"to create a rational from a float:"

# ╔═╡ dedf9030-e153-11ea-112d-93b2ff547a0d
Rational(2.5)

# ╔═╡ f95098e0-e155-11ea-0b45-59df04b48295
# approximate representation of the float, the return that you expect
rationalize(1.20)

# ╔═╡ fc57e56e-e155-11ea-10e9-b3bf0df82310
Rational(1.2)

# ╔═╡ d743e90e-e140-11ea-32af-8d7137f6f85a
md"Julia will reduce a rational if the numerator and denominator have common factors."

# ╔═╡ 61ceb2a0-e154-11ea-3121-2902a16471d7
b=10//25

# ╔═╡ 7d8ff3f0-e154-11ea-126e-d5d81167f6fa
c= a1+b

# ╔═╡ 85263e80-e154-11ea-0383-a112197c530f
numerator(c) # finds numerator of c

# ╔═╡ d1c93b70-e154-11ea-25b5-2736617a5cbe
denominator(c) # finds denominator of c

# ╔═╡ d52f22c0-e154-11ea-02d9-3ba3a5badbcc
a3 = 1 // 0

# ╔═╡ 26fbb000-e155-11ea-3883-7108f5ea84cb
 
#but a NaN is not:
 0 // 0 # this will generate an error message

# ╔═╡ 30c02fc0-e156-11ea-2b16-0799ac9edb47
0x02//0xA # rational of unsigned integer, hexadecimal base


# ╔═╡ 19a98360-e159-11ea-1127-a5c220e29480
decimal(0o100)     

# ╔═╡ 2ee571c0-e155-11ea-3068-a55c8e8e7f68
#If you want to transform a rational back into a float, you only need to write:
float(c)

# ╔═╡ 0845cf80-e144-11ea-25ab-699996cbc388
 subtypes(Integer)

# ╔═╡ 15387a30-e144-11ea-0aee-993b127bfb81
0xEFAD #hexadecimal

# ╔═╡ c4cdc6e0-e143-11ea-2955-c7dd87731da8
0b10101 #unsigned integer, binary base

# ╔═╡ d0ddd9c0-e143-11ea-3f0f-c385dbff1163
true # boolean

# ╔═╡ 292fc380-e154-11ea-01a1-fb30c1a83c78
supertype(Float64)

# ╔═╡ d33ef940-e159-11ea-320f-cb7c2aeb3d18
4 + 3im # imaginary numbers exist. 

# ╔═╡ d6f7e290-e159-11ea-01f3-09fdb54c7c58
complex(4,3) # same as above

# ╔═╡ e45f7120-e143-11ea-03b9-af0dd09cb4ca
"String" # string

# ╔═╡ 6a385d50-e155-11ea-14d5-2b1112d525e0
#You can fix the type a variable with the operator :: (read as “is an instance of”):
afloat::Float64 = 1 # fixes type of a to generate type-stable code.
#does not work in Pluto but does in normal Julia!

# ╔═╡ 83a415e0-e155-11ea-2d5b-d103cae07d1a
#You can also check a variable’s size in memory:
sizeof(a)

# ╔═╡ 4cb46b20-e15a-11ea-1c83-67151959afd5
sizeof(a1)

# ╔═╡ 5153e3e0-e15a-11ea-217b-d991d5ae2c65


# ╔═╡ 9541d210-e155-11ea-0f22-09263be0a005
#If you want to know more about the state of your memory at any given time, you can
#check the workspace in JuliaPro or type
varinfo()

# ╔═╡ 97b1e150-e14d-11ea-089a-bd070ece71d0
md"### Julia has a style guide
(*https://docs.julialang.org/en/latest/manual/style-guide/*)
for variables, functions, and types naming conventions. By default, integers values will be Int64 and floating point values will be Float64 , but we also have shorter and longer types (see Figure 1.4 again). Particularly useful for computations with absolute large numbers (this happens sometimes, for example, when evaluating likelihood functions), we have BigFloat. In the unlikely case that BigFloat
does not provide you with enough precission, Julia can use the GNU Multiple Precision
arithmetic (GMP) (https://gmplib.org/) and the GNU MPFR Libraries (http://www.
mpfr.org/).

You can check the minimum and maximum value every type can store with the functions
typemin() and typemax() , the machine precision of a type with eps() and, if it is a floating point, the effective bits in its mantissa by precision()
"

# ╔═╡ b4ee6510-e15a-11ea-1624-5d65c530c9b2
precision(Float64) #53 digits

# ╔═╡ dea6efd0-e15a-11ea-3d2d-138518e5f584
precision(Float16)

# ╔═╡ f4ee7a70-e159-11ea-2c6e-4b0392b1f352
typemin(Int)

# ╔═╡ f75c9440-e159-11ea-0b81-79d2f80dcc4f
typemin(Int8)

# ╔═╡ 157c8610-e15a-11ea-18dc-630e597274d8
typemin(Int16)

# ╔═╡ 1ce494b0-e15a-11ea-32fb-2d49b0fbb155
typemin(Int32)

# ╔═╡ 11b2d3e0-e15a-11ea-2a8d-bfa14c765b61
typemin(Int64)

# ╔═╡ 13e87890-e15a-11ea-28fd-7b2112158cb4
eps(Float64) # returns 2.22e-16

# ╔═╡ 315e2900-e14c-11ea-348e-75f5b9d78841
md"comparison of floating point depends on eps(): "

# ╔═╡ 38205ab0-e14c-11ea-1c37-8d53bbf9396c
Float64(1.2) ≈ 1.2+(80530638)*eps(Float64)  # \approx +tab

# ╔═╡ dad93c70-e14e-11ea-19e8-77dc64c4ebc7
(80530638)*eps(Float64)

# ╔═╡ dc5a5e2e-e14e-11ea-1ddf-a9acaadfb425
(80530639)*eps(Float64)

# ╔═╡ ac37e09e-e15e-11ea-26f0-d34d6579c8f6
#binary representation:
bitstring(4.3)

# ╔═╡ 82b1e21e-e15f-11ea-3391-81d441813972
Base.convert(Float32,2//3) # convert variable x to a type T

# ╔═╡ bac353c0-e15e-11ea-3243-632090142095
Float32(1//3) # same as above   

# ╔═╡ ca793d22-e15e-11ea-23f6-f7db0f2fa58d
promote(1, true,1.0, 2//1) # promotes arguments to most general type containing all.

# ╔═╡ ec08c2f0-e14d-11ea-258f-f91d0f1b00ac
md"Although, as mentioned above, Julia will take care of converting types automatically most of the times, in some occasions you may want to convert and promote among types explicitly:

1. convert(T,x) # convert variable x to a type T
2. T(x) # same as above
3. promote(1, 1.0) # promotes both variables to 1.0, 1.0"

# ╔═╡ 43d303f0-e14f-11ea-3fa8-29aa5f0e22fb
md"You can define your own types, conversions, and promotions. As an example of a user-defined conversion:"

# ╔═╡ 06af0ea0-e15f-11ea-1c12-0901e8bd206c
convert(::Type{Bool}, x::Real) = x<=10.0 ? false : x>10.0 ? true : throw(
InexactError())

# ╔═╡ 01050e42-e160-11ea-3e4c-43b9999bbf18
subtypes(AbstractFloat)

# ╔═╡ 27160a3e-e15f-11ea-0e4d-65b848424563
Bool(x::Real) = x<= 10.0 ? false : x>10.0 ? true : throw(InexactError())

# ╔═╡ fbd9659e-e160-11ea-1a45-8b24f28505b2
typemin(Bool)

# ╔═╡ d2fb78e0-e15f-11ea-2d25-755441e92152
Bool(2.0) #works because of the definition below!

# ╔═╡ 45048bd0-e15f-11ea-175e-b3b9140b511f
convert(Bool, 2.0)           

# ╔═╡ c54f1b1e-e15f-11ea-0a0e-d9aeda93a8a7
Bool(1)

# ╔═╡ 63d179be-e14f-11ea-23fc-eb28313e4de2
md"""1. eval(a) # evaluates expression a in a global scope
2. real(a) # real part of a
3. imag(a) # imaginary part of a
4. reim(a) # real and imaginary part of a (a tuple)
5. conj(a) # complex conjugate of a
6. angle(a) # phase angle of a in radians
7. cis(a) # exp(i*a)
8. sign(a) # sign of a"""

# ╔═╡ e03071d0-e161-11ea-08a1-5b301fb63905
 ceil(a) # round up  

# ╔═╡ eb5672d0-e161-11ea-1681-0f5e07fc27e9
round(a) # rounding a to closest floating point natural

# ╔═╡ f6e9b490-e161-11ea-373c-f1eb0f16b24e
floor(a) # round down

# ╔═╡ 0ba46830-e162-11ea-1f6f-9b5922d49c8b
trunc(a) # truncate toward zero

# ╔═╡ 1d11c590-e162-11ea-3d6e-9302d7609621
clamp(1,9,10) # returns a clamped to [9,10]

# ╔═╡ 901babde-e14f-11ea-0adc-a9f6ead79478
md"""### Arithmetic operators
- '	+ - * / ^ # arithmetic operations
- +.  -.  *.  /.  ^.  # element-by-element operations (for vectors and matrices)
- // # division for rationals that produces another rational
- +a # identity operator
- -a # negative of a
- a+=1 # a = a+1, can be applied to any operator
- a\b # b/a
- div(a,b) ,  a÷b # a/b, truncated to an integer
- cld(a,b) # ceiling division
- fld(a,b) # flooring division
- rem(a,b) # remainder of a/b
- mod(a,b) # module a,b
- mod1(a,b) # module a,b after flooring division
- gcd(a,b) # greatest positive common denominator of a,b
- gcdx(a,b) # gcd of a and B and their minimal Bezout coefficients
- lcm(a,b) # least common multiple of a,b """

# ╔═╡ 4bfbcfe0-e162-11ea-1203-0f42ae542cf0
modf(5//4) # tuple with the fractional and integral part of a

# ╔═╡ 5ae19800-e162-11ea-19ba-112df2a09e5f
mod2pi(10) # module after division by 2π

# ╔═╡ 6eb769e0-e162-11ea-1753-c795d8c5c96f
+(a,b)

# ╔═╡ 7a3771c0-e162-11ea-2663-df28056380c3
+(a,b,c,3+1im)

# ╔═╡ 686cb750-e150-11ea-0198-bd473e8e2e5b
gcdx(12,15)

# ╔═╡ 82560450-e150-11ea-1cb5-1349570970c0
min(a,🐳,☎) # min of a and (can take as many arguments as desired)
#max(a,b) # max of a and (can take as many arguments as desired)
#minmax(a,b) # min and max of a and b (a tuple return)
#muladd(a,b,c) # a*b+c

# ╔═╡ d809dde0-e150-11ea-2e5f-5bf82b145124
md"""Note, in particular, the use of the . to vectorize an operation (i.e., to apply an operation
to a vector or matrix instead of an scalar). While Julia does not require vectorized code to
achieve high performance (this is delivered through multiple dispatch and JIT compilation), vectorized code is often easier to write, read, and debug. Julia accepts the alternative notations"""

# ╔═╡ 3c6f5030-e151-11ea-36d8-69872ccb9a5a
broadcast(+, 1,[1,2,3,4,5]) == 1 .+ [1,2,3,4,5]

# ╔═╡ 64995ca0-e15a-11ea-2c7e-7d0c0bf86745
 methods(+) # methods for sum

# ╔═╡ 704d6cd0-e15a-11ea-0596-f9d5edc6bc1b
methods(*)

# ╔═╡ 6ed99180-e15a-11ea-328d-efab892c5901


# ╔═╡ 2a54e9f0-e151-11ea-017b-f519cae3fe7e
md"""### 1.5.4 Boolean operators and ascertain functions"""

# ╔═╡ 139899f0-e151-11ea-261b-4fb6231e4cec
md"""
1. ! # not
2. && # and
3. || # or
4. == # is equal?
5. !== # is not equal?
6. === # is equal? (enforcing type 2===2.0 is false
7. ' >  bigger than
8. ' >=  bigger or equal than
9. <  less than
10. <=  less or equal than
11 ~ # bitwise not, per byte (8 bits), per 2(16), 4(32), 8(64), 16(128) bytes
12 & # bitwise and
13 | # bitwise or
14 xor # bitwise xor (also typed by \xor or \veebar + tab)
15 >> # right bit shift operator
16 << # left bit shift operator
17 >>> # unsigned right bit shift operator"""

# ╔═╡ a53797b0-e162-11ea-1b9a-7be4dc40d260
a === 7*a

# ╔═╡ 21e640c0-e151-11ea-2178-c9ea905bf9b0
 ~0b10101010

# ╔═╡ f064cd40-e151-11ea-008b-f92844c43ad6
~0x123456789abcdef012123456789abcde

# ╔═╡ ba97da20-e162-11ea-2afd-1bd6dd965269
#Note that the logical operators are lazy in Julia (in fact, all functions in Julia are lazy and logical operators are just one example of functions). That is, they are only evaluated when needed:
2 > 3 && println("I am lazy")

# ╔═╡ bcd37240-e162-11ea-0069-371db3fa43be


# ╔═╡ 8b6ac6a0-e152-11ea-1a59-21e574a977fe
md"## and the ascertain functions"

# ╔═╡ c7980ca0-e152-11ea-0862-0579aa061820
md"""
+ isa(a,Float64)
- isnumeric(a)
- iseven(a)
- isodd(a)
- ispow2(a)
- isfinite(a)
- isinf(a)
- isnan(a)
with self-explanatory uses and same rules than for logical operators. All of them have also their converse starting with "!" . Just, for example:"""


      

# ╔═╡ d4c69490-e162-11ea-04b0-1542a09a93c6
!iseven(3) # returns true

# ╔═╡ e9463b00-e162-11ea-04f0-e376fa897845
!iseven(2)

# ╔═╡ f990c340-e162-11ea-3f8e-09832fb57228
md"""## Broadcasting
for Dataframes and Timeseries, one sees .operator usage.
TimeSeries supports common mathematical (such as .+), comparison (such as .==) ,
and logic (such as .&) operators. The operations are only calculated on values that
share a timestamp. All of the operations must be treated as dot-call."""

# ╔═╡ 1c22f690-e153-11ea-1cb1-7bfff9e94267
md"## for more Detail 
see **<https://www.sas.upenn.edu/~jesusfv/Chapter_HPC_8_Julia.pdf>**"

# ╔═╡ Cell order:
# ╟─2a836ea0-e13e-11ea-0788-791c7f9a3555
# ╟─6d177fe0-e13e-11ea-0ffb-4f227e4a677f
# ╠═6568fd1e-e164-11ea-3dce-41f42a669860
# ╠═68482840-e164-11ea-2d89-a55141ab0450
# ╠═6fd487c0-e164-11ea-1567-43851926625b
# ╟─91626c70-e13e-11ea-0eb2-5b3098ff5895
# ╟─35c566d0-e164-11ea-1a1c-05b982890ce5
# ╟─bb78a790-e13e-11ea-2dd6-6ff0f7943390
# ╠═01f73770-e155-11ea-300c-21ad8eefbf88
# ╟─9307a612-e140-11ea-04bf-51237db18b39
# ╠═96424230-e141-11ea-32e6-9dd64a44c8f0
# ╠═f697ee10-e140-11ea-25d3-790d2966953d
# ╠═ec4394f0-e140-11ea-3d5c-4d956b99c6d2
# ╟─9d36c3f0-e140-11ea-02ef-0d8858fac919
# ╠═bb99b230-e140-11ea-2b29-21e1e86db5b9
# ╠═349eaf00-e141-11ea-1d2f-03d5a65e7e2b
# ╟─85f80810-e141-11ea-3b43-ed68f8185f34
# ╟─c3d10240-e141-11ea-267c-a756a6eb98bd
# ╠═069dafb0-e142-11ea-264f-db24f8b2550f
# ╠═61dc2552-e142-11ea-214d-9fdfa45fbce7
# ╟─773ed8c0-e142-11ea-23e1-1d4f359277b9
# ╟─9272ce30-e142-11ea-2c90-212e2539f538
# ╠═d684a5ce-e142-11ea-0975-a960347b560d
# ╠═e512ff20-e142-11ea-10db-7f8e19c07ebe
# ╠═f7ebd360-e142-11ea-08cf-99a7b24d5db1
# ╠═b8298520-e155-11ea-2ac4-ff963d8af262
# ╠═00abd0e0-e143-11ea-34dd-df017f6b71bf
# ╟─807681d0-e143-11ea-1487-d797128c5fd5
# ╠═6064ab0e-e143-11ea-243c-7fed812f1ed2
# ╠═d30f1e60-e153-11ea-17d8-f17d6d421fa1
# ╠═3dc9f6ce-e154-11ea-1fb8-c35cf5580682
# ╠═656d45e0-e143-11ea-318f-8560882b3088
# ╠═dedf9030-e153-11ea-112d-93b2ff547a0d
# ╠═f95098e0-e155-11ea-0b45-59df04b48295
# ╠═fc57e56e-e155-11ea-10e9-b3bf0df82310
# ╠═d743e90e-e140-11ea-32af-8d7137f6f85a
# ╠═61ceb2a0-e154-11ea-3121-2902a16471d7
# ╠═7d8ff3f0-e154-11ea-126e-d5d81167f6fa
# ╠═85263e80-e154-11ea-0383-a112197c530f
# ╠═d1c93b70-e154-11ea-25b5-2736617a5cbe
# ╠═d52f22c0-e154-11ea-02d9-3ba3a5badbcc
# ╠═26fbb000-e155-11ea-3883-7108f5ea84cb
# ╠═30c02fc0-e156-11ea-2b16-0799ac9edb47
# ╠═19a98360-e159-11ea-1127-a5c220e29480
# ╠═2ee571c0-e155-11ea-3068-a55c8e8e7f68
# ╠═0845cf80-e144-11ea-25ab-699996cbc388
# ╠═15387a30-e144-11ea-0aee-993b127bfb81
# ╠═c4cdc6e0-e143-11ea-2955-c7dd87731da8
# ╠═d0ddd9c0-e143-11ea-3f0f-c385dbff1163
# ╠═292fc380-e154-11ea-01a1-fb30c1a83c78
# ╠═d33ef940-e159-11ea-320f-cb7c2aeb3d18
# ╠═d6f7e290-e159-11ea-01f3-09fdb54c7c58
# ╠═e45f7120-e143-11ea-03b9-af0dd09cb4ca
# ╠═6a385d50-e155-11ea-14d5-2b1112d525e0
# ╠═83a415e0-e155-11ea-2d5b-d103cae07d1a
# ╠═4cb46b20-e15a-11ea-1c83-67151959afd5
# ╠═5153e3e0-e15a-11ea-217b-d991d5ae2c65
# ╠═9541d210-e155-11ea-0f22-09263be0a005
# ╟─97b1e150-e14d-11ea-089a-bd070ece71d0
# ╠═b4ee6510-e15a-11ea-1624-5d65c530c9b2
# ╠═dea6efd0-e15a-11ea-3d2d-138518e5f584
# ╠═f4ee7a70-e159-11ea-2c6e-4b0392b1f352
# ╠═f75c9440-e159-11ea-0b81-79d2f80dcc4f
# ╠═157c8610-e15a-11ea-18dc-630e597274d8
# ╠═1ce494b0-e15a-11ea-32fb-2d49b0fbb155
# ╠═11b2d3e0-e15a-11ea-2a8d-bfa14c765b61
# ╠═fbd9659e-e160-11ea-1a45-8b24f28505b2
# ╠═13e87890-e15a-11ea-28fd-7b2112158cb4
# ╟─315e2900-e14c-11ea-348e-75f5b9d78841
# ╠═38205ab0-e14c-11ea-1c37-8d53bbf9396c
# ╠═dad93c70-e14e-11ea-19e8-77dc64c4ebc7
# ╠═dc5a5e2e-e14e-11ea-1ddf-a9acaadfb425
# ╠═ac37e09e-e15e-11ea-26f0-d34d6579c8f6
# ╠═82b1e21e-e15f-11ea-3391-81d441813972
# ╠═bac353c0-e15e-11ea-3243-632090142095
# ╠═ca793d22-e15e-11ea-23f6-f7db0f2fa58d
# ╟─ec08c2f0-e14d-11ea-258f-f91d0f1b00ac
# ╟─43d303f0-e14f-11ea-3fa8-29aa5f0e22fb
# ╠═06af0ea0-e15f-11ea-1c12-0901e8bd206c
# ╠═01050e42-e160-11ea-3e4c-43b9999bbf18
# ╠═d2fb78e0-e15f-11ea-2d25-755441e92152
# ╠═45048bd0-e15f-11ea-175e-b3b9140b511f
# ╠═c54f1b1e-e15f-11ea-0a0e-d9aeda93a8a7
# ╠═27160a3e-e15f-11ea-0e4d-65b848424563
# ╟─63d179be-e14f-11ea-23fc-eb28313e4de2
# ╠═e03071d0-e161-11ea-08a1-5b301fb63905
# ╠═eb5672d0-e161-11ea-1681-0f5e07fc27e9
# ╠═f6e9b490-e161-11ea-373c-f1eb0f16b24e
# ╠═0ba46830-e162-11ea-1f6f-9b5922d49c8b
# ╠═1d11c590-e162-11ea-3d6e-9302d7609621
# ╟─901babde-e14f-11ea-0adc-a9f6ead79478
# ╠═4bfbcfe0-e162-11ea-1203-0f42ae542cf0
# ╠═5ae19800-e162-11ea-19ba-112df2a09e5f
# ╠═6eb769e0-e162-11ea-1753-c795d8c5c96f
# ╠═7a3771c0-e162-11ea-2663-df28056380c3
# ╠═686cb750-e150-11ea-0198-bd473e8e2e5b
# ╠═82560450-e150-11ea-1cb5-1349570970c0
# ╟─d809dde0-e150-11ea-2e5f-5bf82b145124
# ╠═3c6f5030-e151-11ea-36d8-69872ccb9a5a
# ╠═64995ca0-e15a-11ea-2c7e-7d0c0bf86745
# ╠═704d6cd0-e15a-11ea-0596-f9d5edc6bc1b
# ╠═6ed99180-e15a-11ea-328d-efab892c5901
# ╟─2a54e9f0-e151-11ea-017b-f519cae3fe7e
# ╟─139899f0-e151-11ea-261b-4fb6231e4cec
# ╠═a53797b0-e162-11ea-1b9a-7be4dc40d260
# ╠═21e640c0-e151-11ea-2178-c9ea905bf9b0
# ╠═f064cd40-e151-11ea-008b-f92844c43ad6
# ╠═ba97da20-e162-11ea-2afd-1bd6dd965269
# ╠═bcd37240-e162-11ea-0069-371db3fa43be
# ╠═8b6ac6a0-e152-11ea-1a59-21e574a977fe
# ╟─c7980ca0-e152-11ea-0862-0579aa061820
# ╠═d4c69490-e162-11ea-04b0-1542a09a93c6
# ╠═e9463b00-e162-11ea-04f0-e376fa897845
# ╟─f990c340-e162-11ea-3f8e-09832fb57228
# ╟─1c22f690-e153-11ea-1cb1-7bfff9e94267
