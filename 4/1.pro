domains
	type = integer
	list = type*
	listlist = list*
predicates
	nondeterm unionset(list,list,list)
	nondeterm intersect(list,list,list)
	nondeterm dellist(list,list,list)
	nondeterm decart(list,list,listlist)
	nondeterm cart(list,list,list,listlist)
	nondeterm member(type,list)
clauses
	member(X,[X|_]).
	member(X,[_|T]):-member(X,T).

	unionset([],L,L).
	unionset([H|T1], L1, L2):- member(H, L1), unionset(T1, L1, L2).
	unionset([H|T1], L1, [H|L2]):- not(member(H, L1)), unionset(T1, L1, L2).

	intersect([],_,[]).
	intersect([H|T1],L2,[H|T2]):- member(H,L2), intersect(T1,L2,T2).
	intersect([H|T1],L2,L):- not(member(H,L2)), intersect(T1,L2,L).

	dellist([], L1, L1).
	dellist([H|T], L1, R):- member(H, L1), dellist(T, L1, R).
	dellist([H|T], L1, [H|R]):- not(member(H, L1)), dellist(T, L1, R).

	decart(L1,L2,L):-cart(L1,L2,L2,L).

	cart([A|X1],[B|X],X2,[ [A,B] |L]):-!,cart([A|X1],X,X2,L).
	cart([A|X1],[],X2,L):-!, cart(X1,X2,X2,L).
	cart([],_,_,[]).
	cart(_,[],_,[]).
GOAL
	%unionset([1,3,5,7,9], [2,4,6,8,0], L).
	%unionset([4,1,3,5,7,9,2,6,8], [2,4,6,8], L).
	%intersect([1,3,4,6,7,8,9],[9,2,5,1,7,0], L).
	%dellist([1,2,3,4,5,6,7,8,9],[1,3,5,7,9,0],L).
	%decart([1,2,3],[9,8,7],L).
	%decart([1, 2, 3], [a, b, c], L1), decart([x, y, z], L1, L).