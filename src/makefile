sql_interpreter_parser.out: sql_interpreter_parser.yy.c
	gcc -o sql_interpreter_parser.out sql_interpreter_parser.yy.c
sql_interpreter_parser.yy.c: sql_interpreter_parser.l
	flex -o sql_interpreter_parser.yy.c sql_interpreter_parser.l
clean:
	rm -rf sql_interpreter_parser.out sql_interpreter_parser.yy.c