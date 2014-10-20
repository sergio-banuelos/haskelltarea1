{-
simbolos
and &&
or  ||
implica <=
bicondicional ==
xor /=


-}	

equiv2 ::  (Bool ->Bool -> Bool) -> (Bool->Bool->Bool) -> Bool
equiv2 func1 func2 = and [ 
		(func1 a b )==(func2 a b )  |  							
		a <- [True,False], b <-[True,False]
	]

equiv3 ::  (Bool ->Bool -> Bool ->Bool) -> (Bool->Bool->Bool->Bool) -> Bool
equiv3 func1 func2 = and [ 
		(func1 a b c)==(func2 a b c )  |  							
		a <- [True,False], b <-[True,False], c <-[True,False]
	]

main = print (

		-- 15 en esta la respuesta debe ser falsa, no lo olvidéis
		equiv3 
		(\ p q r -> (p <= q ) <= r) 
	 	(\ a b c-> a <= ( b <= c)),	
	 	--16
	 	equiv2
 		(\ p q -> ( p <= q )) 
 		(\ a b -> ( not b ) <= (not a)),

 		--17
 		equiv2
 		(\ p q -> (not p) ==  q ) 
 		(\ a b -> a == (not b)),

 		--18
 		equiv2
 		(\ p q -> not (p /= q)) 	
 		(\ a b -> a == b), 	

 		--19
		equiv2
 		(\ p q  -> not q <= not p)
		(\ a b ->  a <= b),

		--20
		equiv3 
		(\ p q r -> (p <= q ) && (p <= r ))
		(\ a b c ->  a <= (b && c)),

		--21
		equiv3 
		(\ p q r -> (p <= r ) && (q <= r ))
		(\ a b c -> (a || b) <= c),

		--22
		equiv3 
		(\ p q r -> (p <= q ) || (p <= r ))
		(\ a b c -> a <= (b || c)),

		--23
		equiv3 
		(\ p q r -> (p <= r ) || (q <= r ))
		(\ a b c -> (a && b) <= c),

		--24
		equiv3 
		(\ p q r -> not p <= ( q <= r ) )
		(\ a b c -> b <= ( a || c ) ),

		--25
		equiv2 
		(\ p q  -> p == q)
		(\ a b -> (a <= b) && (b <= a)),

		--26
		equiv2 
		(\ p q -> p == q )
		(\ a b -> (not a) == (not b))
		
		)
