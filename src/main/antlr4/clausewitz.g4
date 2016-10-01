grammar clausewitz;

@header {
	package uk.co.robertmichaelwalsh.clausewitz.parser;
}

start : line+;

line : (assign )+;

assign : Id '=' expression;

expression : Id | literal | clause ;

clause : '{' (clause_item)+ '}';

clause_item : assign | Id ;

literal : Int | Float | String | Date | Bool | Hex;


/* Lexical Syntax */

Id : [a-zA-Z_][a-zA-Z0-9_]*;

Int : ('+'|'-')? [0-9]+;

Float : ('+'|'-')? [0-9]+'.'[0-9]+;

String : '"' [a-zA-Z0-9_ ]+ '"';

Date : [0-9]+ '.' [0-9]+ '.' [0-9]+;

Bool : 'yes'|'no';

Hex : [0-9a-fA-F]+;

Comment : '#' ~[\r\n]* -> skip;

WS: [ \n\t\r]+ -> skip;
