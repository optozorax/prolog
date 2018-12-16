domains
	poly = op(char, poly, poly); s(symbol); i(integer); r(real)
predicates
	nondeterm polynomial(poly, poly)
	constant()
clauses
	polynomial(X, X).
	polynomial(i(N), X).
	polynomial(r(N), X).
	polynomial(op('+', Term1, Term2), X):- 
		polynomial(Term1, X), 
		polynomial(Term2, X).
	polynomial(op('-', Term1, Term2), X):- 
		polynomial(Term1, X), 
		polynomial(Term2, X).
	polynomial(op('*', Term1, Term2), X):- 
		polynomial(Term1, X), 
		polynomial(Term2, X).
	polynomial(op('/', Term1, i(N)), X):- 
		polynomial(Term1, X).
		polynomial(op('/', Term1, r(N)), X):- 
		polynomial(Term1, X).
	polynomial(op('^', Term1, i(N)), X):- 
		polynomial(Term1, X).
goal
	polynomial().