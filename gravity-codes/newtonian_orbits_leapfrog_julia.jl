function gravforce(r)
	force = -r./((r[1]^2 + r[2]^2)^(3/2))
end

function leapfrog(r, v, a, dt)
	v = v + (0.5*dt).*a
	
	r = r + dt.*v
	a = gravforce(r)
	v = v + (0.5*dt).*a
	
	return r, v, a
end 

function totalenergy(r, v)
	kinetic = 0.5*(v[1]^2 + v[2]^2)
	potential = -(r[1]^2 + r[2]^2)^(1/2)

	return kinetic + potential
end 
