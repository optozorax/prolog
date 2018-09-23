predicates
	nondeterm isletter(char)
clauses 
	isletter(Ch):- 'a'<=Ch, Ch<='z'. 
	isletter(Ch):- 'A'<=Ch, Ch<='Z'.
goal
	%isletter('x').
	isletter('2').
	%isletter('hello').
	%isletter(a).
	%isletter(X).