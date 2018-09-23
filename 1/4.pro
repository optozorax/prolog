predicates
	nondeterm parent(symbol,symbol)
	nondeterm happy(symbol)
	nondeterm have_two_child(symbol)
	nondeterm grandson(symbol, symbol)
	nondeterm sister(symbol, symbol)
	nondeterm aunt(symbol, symbol)
	nondeterm predok(symbol, symbol)
clauses
	parent(pam,bob).
	parent(tom,bob).
	parent(tom,liz).
	parent(bob,enn).
	parent(bob,pat).
	parent(pat,jim).
	happy(Name):- parent(Name, _).
	have_two_child(Name):- parent(Name, Name2) and parent(Name, Name3) and Name2 <> Name3.
	grandson(Name, Name2):- parent(X, Name) and parent(Name2, X).
	sister(Name, Name2):- parent(X, Name) and parent(X, Name2).
	aunt(Name, Name2):- parent(X, Name2) and sister(X, Name) and not(parent(Name, Name2)).
	
	predok(Name, Name2):- parent(Name, Name2).
	predok(Name, Name2):- predok(X, Name2), parent(Name, X).
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
	
	%sister(pat, X).
	%aunt(X, pat).
	
	predok(X, jim).