domains
	f = tree(symbol, f, f); s(symbol)
predicates
	nondeterm optimize(f, f)
	equal(f, f, f, f)
clauses
	equal(A, B, C, D):- A=B, C=D.

	optimize(s(A), s(A)):- not(A=true), not(A=false).

	optimize(tree("V", _, s(true)), s(true)):- !.
	optimize(tree("V", s(true), _), s(true)).
	optimize(tree("V", F, s(false)), F1):- optimize(F, F1).
	optimize(tree("V", s(false), F), F1):- optimize(F, F1).

	optimize(tree("&", F, s(true)), F1):- optimize(F, F1).
	optimize(tree("&", s(true), F), F1):- optimize(F, F1).
	optimize(tree("&", _, s(false)), s(false)):- !.
	optimize(tree("&", s(false), _), s(false)).

	optimize(tree(S, L, R), F):- 
		optimize(L, L1), 
		optimize(R, R1), 
		not(equal(L, L1, R, R1)), 
		optimize(tree(S, L1, R1), F).
goal
	%optimize(tree("V", s(true), s(f2)), F).
	%optimize(tree("&", s(true), tree("V", s(true), s(f2))), F).
	%optimize(tree("&", s(false), s(false)), F).
	%optimize(tree("V", tree("&", s(false), s(false)), tree("&", s(true), tree("V", s(true), s(f2)))), F).
	%optimize(tree("&", s(true), tree("V", tree("&", s(true), tree("V", s(true), s(f2))), tree("&", s(false), s(false)))), F).
	%optimize(tree("&", s(f2), tree("V", tree("&", s(true), tree("V", s(true), s(f2))), tree("&", s(false), s(false)))), F).