function R = planets_area(star_system)
	
	a = star_system(2, :) 
	b = star_system(3, :) 
	c = star_system(4, :)
 	
	# ((a.x * (b.y - c.y) + b.x * (c.y - a.y) + c.x * (a.y - b.y)) / 2.0).abs
	area = abs((a(1) * (b(2) - c(2)) + b(1) * (c(2) - a(2)) + c(1) * (a(2) - b(2)) / 2))

	R = area

endfunction