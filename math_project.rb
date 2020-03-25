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
	
	def User_matrix.transpose(m)
		rows = m.length
		cols = m[0].length
		mtr = Array.new(cols){Array.new(rows, 0.0)}
		
		for i in 0...cols
			for j in 0...rows
				mtr[i][j] = m[j][i]
			end
		end
		
		return mtr
	end
	
	def User_matrix.det(m)
		# Make sure matrix is 2x2 or 3x3
		rows = m.length
		cols = m[0].length
				
		if not ((rows==2 and cols==2) or (rows==3 and cols==3))
			puts "Error: must be 2x2 or 3x3 matrix"
			return
		end
		
		det = 0
		det1 = 0
		det2 = 0
		det3 = 0
		
		if (rows==2 and cols==2)
			det = m[0][0]*m[1][1]-m[0][1]*m[1][0]
		elsif (rows==3 and cols==3)
			det1 = m[0][0]*(m[1][1]*m[2][2]-m[1][2]*m[2][1])
			det2 = m[0][1]*(m[1][0]*m[2][2]-m[1][2]*m[2][0])
			det3 = m[0][2]*(m[1][0]*m[2][1]-m[1][1]*m[2][0])
			
			det = det1-det2+det3
		end
		
		return det
	end
	
	def User_matrix.inverse(m)
		# Make sure matrix is 2x2 or 3x3
		rows = m.length
		cols = m[0].length
				
		if not ((rows==2 and cols==2) or (rows==3 and cols==3))
			puts "Error: must be 2x2 or 3x3 matrix"
			return
		end
		
		minv = Array.new(rows){Array.new(cols, 0.0)}
		det = User_matrix.det(m)
		
		if (det == 0.0)
			puts "Error: determinant is zero"
			return
		end
		
		if (rows==2 and cols==2)
			minv[0][0] = (1.0/det)*m[1][1]
			minv[1][1] = (1.0/det)*m[0][0]
			minv[0][1] = (-1.0/det)*m[0][1]
			minv[1][0] = (-1.0/det)*m[1][0]

		elsif (rows==3 and cols==3)
			minv[0][0] = (1.0/det)*(m[1][1]*m[2][2]-m[1][2]*m[2][1])
			minv[1][0] = (-1.0/det)*(m[1][0]*m[2][2]-m[1][2]*m[2][0])
			minv[2][0] = (1.0/det)*(m[1][0]*m[2][1]-m[1][1]*m[2][0])
			
			minv[0][1] = (-1.0/det)*(m[0][1]*m[2][2]-m[0][2]*m[2][1])
			minv[1][1] = (1.0/det)*(m[0][0]*m[2][2]-m[0][2]*m[2][0])
			minv[2][1] = (-1.0/det)*(m[0][0]*m[2][1]-m[0][1]*m[2][0])
			
			minv[0][2] = (1.0/det)*(m[0][1]*m[1][2]-m[0][2]*m[1][1])
			minv[1][2] = (-1.0/det)*(m[0][0]*m[1][2]-m[0][2]*m[1][0])
			minv[2][2] = (1.0/det)*(m[0][0]*m[1][1]-m[0][1]*m[1][0])
		end
		
		return minv
	end

end
