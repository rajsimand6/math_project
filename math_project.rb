#!/usr/bin/env ruby

module User_matrix
	def User_matrix.zeros(r, c)
		# Make sure r/c are positive integers
		cond1 = r.instance_of?(Integer)
		cond2 = c.instance_of?(Integer)
		cond3 = (r > 0)
		cond4 = (c > 0)
		
		if (not cond1) or (not cond2) or (not cond3) or (not cond4)
			puts "Error: arguments must be positive integers"
			return
		end
		
		m = Array.new(r){Array.new(c, 0.0)}
		return m
	end





end
