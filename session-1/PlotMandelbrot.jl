using Plots
using ColorSchemes
gr()

function mandelbrot(c)
	z = c
	maxiter = 80
	for n in 1:maxiter
		if abs(z) > 2
			return (n-1)::Int
		end
		z = z^2 + c
	end
	return maxiter::Int
end

function plotMandelbrot(xrange::Tuple{Float64, Float64}, yrange::Tuple{Float64, Float64}; n::Int)
	xaxis = collect(LinRange(xrange[1], xrange[2], n))
	yaxis = collect(LinRange(yrange[1], yrange[2], n))
	grid = zeros((n, n))
	
	for i in range(1, length = n)
		for j in range(1, length = n)
			x = xaxis[i]
			y = yaxis[j]
			iteration = mandelbrot(x + y*im)
			grid[i,j] = iteration
		end
	end
	p = heatmap(xaxis, yaxis, grid, c = :thermal, aspect_ratio = 1)
	display(p)
end

plotMandelbrot(vrange::Tuple{Float64, Float64}; n::Int) = plotMandelbrot(vrange, vrange; n)
