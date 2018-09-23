/*
predicates
	nondeterm phone_number(symbol,symbol)
clauses
	phone_number("Albert","ETY-3665") .
	phone_number("Betty","555-5233").
	phone_number("Carol","909-1010").
	phone_number("Dororty","438-8400").
goal
	%phone_number("Carol", Number).
	%phone_number(Who,"438-8400").
	%phone_number("Albert", Number).
	phone_number(Who,Number).
*/   

%----------------------------------------------

/*
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
*/

%----------------------------------------------

/*
predicates
	nondeterm can_buy(symbol,symbol)
	nondeterm person(symbol,integer)
	nondeterm car(symbol,integer)
	likes(symbol,symbol)
	for_sale(symbol)
clauses
	can_buy(Name, Model):-  
	person(Name, Money1)  and
	car(Model, Money2)  and
	likes(Name, Model)  and
	for_sale(Model) and
	Money1 >= Money2.
	person(kelly,77).
	person(judy,50).
	car(lemon,100).
	car(pizza,49).
	car(hot_rod,400).
	likes(kelly, hot_rod).
	likes(judy, pizza).
	for_sale(pizza).
	for_sale(lemon).
	for_sale(hot_rod).
goal
	%can_buy (Who, What).
	%can_buy (judy, What).
	%can_buy (kelly, What).
	can_buy(Who, What).
*/

%----------------------------------------------

predicates
	nondeterm parent(symbol,symbol)
	nondeterm happy(symbol)
	nondeterm have_two_child(symbol)
	nondeterm grandson(symbol, symbol)
	nondeterm predok(symbol, symbol)
clauses
	parent(pam,bob).
	parent(tom,bob).
	parent(tom,liz).
	parent(bob,enn).
	parent(bob,pat).
	parent(pat,jim).
	happy(Name):- parent(Name, _).
	have_two_child(Name):- parent(Name, Name2) and 
	parent(Name, Name3) and Name2 <> Name3.
	grandson(Name, Name2):- parent(X, Name) and 
	parent(Name2, X).
	
	predok(Name, Name2):- parent(Name, Name2).
	predok(Name, Name2):- not(parent(Name, Name2)), predok(Name, Name2).
goal
	%parent(jim,X).
	%parent(X,jim).
	%parent(pam,X), parent(X,pat).
	%parent(pam,X), parent(X,Y), parent(Y,jim).
	
	%parent(X,pat).
	%parent(liz,X).
	%parent(X,Y), parent(Y,pat).
	
	%happy(X).
	%have_two_child(X).
	%grandson(X, Y).
	
	predok(jim, X).