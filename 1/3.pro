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