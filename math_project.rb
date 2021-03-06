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


module User_math
	PI = 3.1415926535898
	
	def User_math.r2d(t)
		return (t*180.0/User_math::PI)
	end
	
	def User_math.d2r(t)
		return (t*User_math::PI/180.0)
	end
	
	def User_math.sind(t)
		return (Math.sin(t*User_math.d2r(t)))
	end
	
	def User_math.cosd(t)
		return (Math.cos(t*User_math.d2r(t)))
	end
	
	def User_math.tand(t)
		return (Math.tan(t*User_math.d2r(t)))
	end

	def User_math.asind(r)
		return (User_math.r2d(Math.asin(r)))
	end
	
	def User_math.acosd(r)
		return (User_math.r2d(Math.acos(r)))
	end
	
	def User_math.atand(r)
		return (User_math.r2d(Math.atan(r)))
	end
	
	def User_math.atan2d(r)
		return (User_math.r2d(Math.atan2(r)))
	end
	
end

module User_polar
	def User_polar.getTrigAngleFromVectorDeg(x, y)
		return (User_math.atand(y/x))
	end
	
	def User_polar.getTrigAngleFromVectorRad(x, y)
		return (Math.atan(y/x))
	end
	
	def User_polar.getUnitVectorFromAngleDeg(t)
		ret = User_matrix.zeros(1, 2)
		ret[0] = User_math.cosd(t)
		ret[1] = User_math.sind(t)
		return ret
	end
	
	def User_polar.getUnitVectorFromAngleRad(t)
		ret = User_matrix.zeros(1, 2)
		ret[0] = Math.cos(t)
		ret[1] = Math.sin(t)
		return ret
	end
	
	def User_polar.convertTrigtoNavAngle(t)
		if (t > 0.0 and t < 90.0)
			n = 90.0 - t
		elsif (t > 90.0 and t < 180.0)
			n = 180.0 + t
		elsif (t > 180.0 and t < 270.0)
			n = 450.0 - t
		elsif (t > 270.0 and t < 360.0)
			n = 450.0 - t
		elsif (t < 0.0 and t > -90.0)
			n = 90.0 - t
		elsif (t < -90.0 and t > -180.0)
			n = 90.0 - t
		elsif (t < -180.0 and t > -270.0)
			n = 90.0 - t
		elsif (t < -270.0 and t > -360.0)
			n = -270.0 - t
		elsif (t == 0.0 or t == 360.0 or t == -360.0)
			n = 90.0
		elsif (t == 90.0 or t == -270.0)
			n = 0.0
		elsif (t == 180.0 or t == -180.0)
			n = 270.0
		elsif (t == 270.0 or t == -90.0)
			n = 180.0
		else
			puts("Error: input must be between -360 and 360 deg")
			return 0
		end
		
		return n
	end
	
	def User_polar.convertNavtoTrigAngle(n)
		if (n > 0.0 and n < 90.0)
			t = 90.0 - n
		elsif (n > 90.0 and n < 180.0)
			t = 450.0 - n
		elsif (n > 180.0 and n < 270.0)
			t = 450.0 - n
		elsif (n > 270.0 and n < 360.0)
			t = 450.0 - n 
		elsif (n == 0.0 or n == 360.0)
			t = 90.0
		elsif (n == 90.0)
			t = 0.0
		elsif (n == 180.0)
			t = 270.0
		elsif (n == 270.0)
			t = 180.0
		else
			puts("Error: input must be between -360 and 360 deg")
			return 0
		end
		
		return t
	end
	
	def User_polar.getNavAngleFromVector(x, y)
		trigAngle = User_polar.getTrigAngleFromVectorDeg(x, y)
		return (User_polar.convertTrigtoNavAngle(trigAngle))
	end
	
	def User_polar.getNavAngleFromTrigAngleRad(t)
		return (User_polar.convertTrigtoNavAngle(User_math.r2d(t)))
	end
	
	def User_polar.getNavAngleFromTrigAngleDeg(t)
		return (User_polar.convertTrigtoNavAngle(t))
	end
	
end


