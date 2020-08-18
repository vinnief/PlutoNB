### A Pluto.jl notebook ###
# v0.11.6

using Markdown
using InteractiveUtils

# ╔═╡ 15189720-e139-11ea-11e0-671548137e9c
md"""## Demo of Pluto notebooks
Pluto Notebooks, unlike Jupyter notebooks, recalculate cells in which variables are used when the variable changes. Also unlike Jypyter notebooks, 
- CTRL-Enter executes and inserts a new cell. 
- Shift-Enter just executes the current cell. 
So try it out. We defined x, then y, 
- then go back and change x. 
All dependent cells will be reactualized. """


# ╔═╡ f579c2f2-e137-11ea-06a2-b9410a7e2ad4
x=2

# ╔═╡ d2e40b00-e138-11ea-14d1-333eaa7cf630
y=[x:(x+10)]


# ╔═╡ f16f1ab0-e138-11ea-3db3-6379fae615b3
power = function(x::T, y::Array{T2,1}) where {T<:Real, T2<:Real}
	[x^a for a in y]
end

# ╔═╡ ddee46a0-e138-11ea-1eef-5745a6bff646
z= power(2,[2,3])

# ╔═╡ 91fc77ce-e165-11ea-3af3-cf6f91d012ee
2 .^ [1,2,3,4,5,6,7]

# ╔═╡ bf257130-e165-11ea-2f70-c5be094bbffd
[2.0:3:.25]

# ╔═╡ 744e96d0-e167-11ea-168e-7fa14ede6ff8
missing^0

# ╔═╡ 37a988c0-e167-11ea-3f50-1b88076a913a
methods(^)

# ╔═╡ 3ae70080-e167-11ea-2552-31ffb7346153


# ╔═╡ Cell order:
# ╟─15189720-e139-11ea-11e0-671548137e9c
# ╠═f579c2f2-e137-11ea-06a2-b9410a7e2ad4
# ╠═d2e40b00-e138-11ea-14d1-333eaa7cf630
# ╠═ddee46a0-e138-11ea-1eef-5745a6bff646
# ╠═f16f1ab0-e138-11ea-3db3-6379fae615b3
# ╠═91fc77ce-e165-11ea-3af3-cf6f91d012ee
# ╠═bf257130-e165-11ea-2f70-c5be094bbffd
# ╠═744e96d0-e167-11ea-168e-7fa14ede6ff8
# ╠═37a988c0-e167-11ea-3f50-1b88076a913a
# ╠═3ae70080-e167-11ea-2552-31ffb7346153
