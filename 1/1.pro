predicates
	nondeterm phone_number(symbol,symbol)
clauses
	phone_number("Albert","ETY-3665") .
	phone_number("Betty","555-5233").
	phone_number("Carol","909-1010").
	phone_number("Dororty","438-8400").
	%phone_number("Kim","438-8400").
goal
	%phone_number("Carol", Number).
	%phone_number(Who,"438-8400").
	%phone_number("Albert", Number).
	phone_number(Who,Number).