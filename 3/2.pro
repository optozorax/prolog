domains
	i = integer
	list = i*
database
	toy_name(symbol)
	toy(symbol,integer,integer,integer)
	price(integer)
	minage(integer)
	maxage(integer)

predicates
	nondeterm choice(integer)
	menu
	nondeterm repeat
	nondeterm task1(symbol,integer,integer)
	nondeterm task2(symbol,integer,integer)
	nondeterm task3(integer) 	
	nondeterm task4(symbol,symbol,integer)		
	nondeterm task5(symbol)
	nondeterm max(list,integer)

clauses
	choice('1'):-
		write("Enter price: "),
		readint(Price),
		write("Enter minimum age: "),
		readint(MinAge),
		task1(_,Price,MinAge).

	choice('2'):-
		write("Enter minimum age: "),
		readint(ReqMinAge),
		write("Enter maximum age: "),
		readint(ReqMaxAge),
		task2(_,ReqMinAge,ReqMaxAge).

	choice('3'):-
		task3(_).

	choice('4'):-
		write("Enter name: "),
		readln(ReqName),
		write("Enter price: "),
		readint(ReqPrice),
		task4(_,ReqName,ReqPrice).

	choice('5'):-
		task5(_).

	choice('6'):-
		write("Name of adding toy: "),
		readln(Name),
		write("Price: "),
		readint(Price),
		write("Minimum age: "),
		readint(MinAge),
		write("Maximum age: "),
		readint(MaxAge),
		assert(toy(Name, Price, MinAge, MaxAge)),
		fail.

	choice('7'):-
		write("The presence of toys in the database:\n"),
		toy(Name,Price,MinAge,MaxAge),
		write("Name : ",Name, ";   Price : ",Price,";   Minimum age : ", MinAge,";   Maximum age : ",MaxAge),nl.

	choice('s'):-		
		save("E:\base"),
		write("Information saved successfully\n").

	choice('l'):-
		existfile("E:\base"),!,
		consult("E:\base").

	choice('0'):- !.

	menu:-		
		repeat,		
		write("------------------------------------\n"),
		write("Make your choice:\n"),
		write("1 - task 1\n"),
		write("2 - task 2\n"),
		write("3 - task 3\n"),
		write("4 - task 4\n"),
		write("5 - task 5\n"),
		write("6 - add information about toy\n"),
		write("7 - show all toys\n"),
		write("s - save database in file\n"),
		write("l - load database from file\n"),
		write("0 - exit\n"),
		readchar(Choice),
		choice(Choice),
		Choice='0',
		!.
	repeat.
	repeat :- repeat.	
	
	task1(Name,ReqPrice,ReqMinAge):-
        toy(Name,Price,Minage,_), 
		Price <= ReqPrice,
		Minage <= ReqMinAge,
		write(Name),nl.

	task2(Name,ReqAge1,ReqAge2):-
		toy(Name,_,Minage,MaxAge),
		ReqAge1 >= MinAge,
		ReqAge2 <= MaxAge,
		write(Name),nl.

	task3(Price):-
		toy(red_blocks,Price1, _, _),  
		toy(blue_blocks,Price2, _, _),
		toy(pink_blocks,Price3, _, _),
		toy(yellow_blocks,Price4, _, _),
		Price=(Price1+Price2+Price3+Price4),
		write(Price),nl.

	task4(Name,ReqName, ReqPrice):-
		findall(N,toy(ReqName,N,_,_),L),
		L=[H|_],
		toy(Name,Price,_,_),
		H+Price <= ReqPrice,
		"ball"<>Name,
		write(Name),nl.

	task5(Name):-
		findall(Price, toy(_,Price,_,_), L),
		max(L,Max),
		toy(Name,Price,_,_),
		abs(Max-Price) <= 1,
		write(Name),nl.

	max([Head|Tail],Result):-
        max(Tail,Result), Result > Head,!.
    max([Head|_],Head).	
	
goal
    menu.