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

	def User_matrix.ones(r, c)
		# Make sure r/c are positive integers
		cond1 = r.instance_of?(Integer)
		cond2 = c.instance_of?(Integer)
		cond3 = (r > 0)
		cond4 = (c > 0)
		
		if (not cond1) or (not cond2) or (not cond3) or (not cond4)
			puts "Error: arguments must be positive integers"
			return
		end
		
		m = Array.new(r){Array.new(c, 1.0)}
		return m
	end
	
	def User_matrix.ident(r)
		# Make sure r is positive integer
		cond1 = r.instance_of?(Integer)
		cond2 = (r > 0)
		
		if (not cond1) or (not cond2)
			puts "Error: argument must be positive integer"
			return
		end
		
		m = User_matrix.zeros(r,r)
		
		for i in 0...r
			m[i][i] = 1.0
		end
		
		return m
	
	end



end
