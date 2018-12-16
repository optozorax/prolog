domains
	file=input
predicates
	nondeterm add_space(string, string, integer)
	nondeterm add_spaces_to_len(string, string, integer)
	nondeterm process_file(file, integer)
	nondeterm test(string, integer)
clauses
	add_space(String, String, 0):- !.
	add_space(String, String, X):- X < 0, !.
	add_space(Result, String, Count):- 
		X=Count-1, 
		add_space(Result1, String, X), 
		frontchar(Result, ' ', Result1).
	
	add_spaces_to_len(Result, String, Size):- 
		str_len(String, Len), 
		Add = Size - Len, 
		add_space(Result, String, Add).
	
	process_file(File, _):- eof(File), !.
	process_file(File, Size):- 
		readln(String), 
		add_spaces_to_len(Result, String, Size), 
		write(Result), nl, 
		process_file(File, Size).
	
	test(Filename, Size):-
		openread(input, Filename), 
		readdevice(input), 
		process_file(input, Size),
		closefile(input).
goal
	test("D:/a.txt", 79).