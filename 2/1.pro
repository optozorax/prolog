domains
	% name, price, age limit from, to
	toy = toy(symbol, unsigned, unsigned)
predicates
	nondeterm toy_fact(toy)
	nondeterm is_more_expensive_exists(unsigned)
	nondeterm most_expensive(toy)
	nondeterm near_most_expensive(toy, unsigned)
clauses
	% toys database
	toy_fact(toy(ball, 1, 10)).
	toy_fact(toy(ball, 2, 7)).
	toy_fact(toy(ball, 5, 7)).
	toy_fact(toy(ball, 10, 5)).
	toy_fact(toy(ball, 15, 5)).
	toy_fact(toy(ball, 16, 4)).
	toy_fact(toy(ball, 3, 5)).
	
	toy_fact(toy(cube, 2, 3)).
	toy_fact(toy(cube, 2, 5)).
	toy_fact(toy(cube, 3, 4)).
	toy_fact(toy(cube, 6, 4)).
	toy_fact(toy(cube, 1, 10)).
	toy_fact(toy(cube, 19, 99)).
	
	toy_fact(toy(doll, 5, 7)).
	toy_fact(toy(doll, 20, 18)).
	
	toy_fact(toy(playstation, 19, 16)).
	
	% logic
	is_more_expensive_exists(Price):-
		toy_fact(toy(_, Price2, _)), 
		Price2 > Price.
		
	most_expensive(toy(Name, Price, Age)):- 
		toy_fact(toy(Name, Price, Age)), 
		not(is_more_expensive_exists(Price)).
		
	near_most_expensive(toy(Name, Price, Age), MaxDifference):-
		toy_fact(toy(Name, Price, Age)), 
		most_expensive(toy(_, Price1, _)), 
		Price1-Price <= MaxDifference.
goal
	toy_fact(toy(Name, X, Age)), X <= 4, Age <= 5.
	%toy_fact(toy(Name, _, Age)), Age <= 4.
	%toy_fact(toy(cube, Price, _)).
	%toy_fact(toy(Name, Y, Age)), toy_fact(toy(ball, X, _)), X+Y <= 6, Age <= 3.
	%near_most_expensive(X, 1).